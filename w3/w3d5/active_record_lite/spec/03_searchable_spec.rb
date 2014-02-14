require 'active_record_lite/03_searchable'

describe "Searchable" do
  before(:each) { DBConnection.reset }
  after(:each) { DBConnection.reset }

  before(:all) do
    class Cat < SQLObject
    end

    class Human < SQLObject
      self.table_name = "humans"
    end
  end

  it "#where searches with single criterion" do
    cats = Cat.where(:name => "Breakfast")
    cat = cats.first

    expect(cats.length).to eq(1)
    expect(cat.name).to eq("Breakfast")
  end

  it "#where can return multiple objects" do
    humans = Human.where(:house_id => 1)
    expect(humans.length).to eq(2)
  end

  it "#where searches with multiple criteria" do
    humans = Human.where(:fname => "Matt", :house_id => 1)
    expect(humans.length).to eq(1)

    human = humans[0]
    expect(human.fname).to eq("Matt")
    expect(human.house_id).to eq(1)
  end
end
