# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer
#  start_date :date
#  end_date   :date
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }

  before_validation(on: :create) do 
    if self.overlapping_approved_requests
      self.status = "PENDING"  
    else
      self.status = "DENIED"
    end
  end
  
  belongs_to(
    :cat,
    foreign_key: :cat_id,
    primary_key: :id,
    class_name: 'Cat'
  )

  def overlapping_requests
    query = <<-SQL
    SELECT *
    FROM cat_rental_requests
    WHERE start_date < DATE(:our_end_date)
      AND end_date > DATE(:our_start_date)
      AND cat_id = :id
    ORDER BY start_date
    SQL

    cat_request = CatRentalRequest.find_by_sql([
      query,
      our_start_date: self.start_date,
      our_end_date: self.end_date,
      id: self.cat_id
    ])
    
    all_cat = cat_request - [self]
  end

  def overlapping_approved_requests
    potential_conflicts = self.overlapping_requests
    potential_conflicts.each do |cat_request|
      return false if cat_request.status == "APPROVED"
    end

    true
  end

  def overlapping_pending_requests
    CatRentalRequest.transaction do
      self.approve!
      self.overlapping_requests.each { |request| request.deny! }
    end
  end

  def deny!
    self.status = "DENIED"
    self.save!
  end

  def approve!
    self.status = "APPROVED"
    self.save!
  end


end
