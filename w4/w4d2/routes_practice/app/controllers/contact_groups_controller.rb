class ContactGroupsController < ApplicationController

  def create
    @contact_group = ContactGroup.new(contact_id: params[:contact_id], group_id: params[:group_id])

    unless Group.valid_add(group_id: params[:group_id], params[:contact_id])?
      render json: 'You can\'t add that user to a group'
    end

    if @contact_group.save
      render json: @contact_group
    else
      render json: @contact_group.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def destroy
    @contact_group = ContactGroup.find(params[:id])
    destroyed_group = @contact_group.dup
    @contact_group.destroy

    render json: destroyed_group
  end

end
