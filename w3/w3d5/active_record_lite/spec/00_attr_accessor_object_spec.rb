require 'active_record_lite/00_attr_accessor_object'

describe AttrAccessorObject do
  before(:all) do
    class MyAttrAccessorObject < AttrAccessorObject
      my_attr_accessor :x, :y
    end
  end

  subject(:obj) { MyAttrAccessorObject.new }

  it "#my_attr_accessor adds #x and #y" do
    expect(obj).to respond_to(:x)
    expect(obj).to respond_to(:y)
  end

  it "#my_attr_accessor adds #x= and #y=" do
    expect(obj).to respond_to(:x=)
    expect(obj).to respond_to(:y=)
  end

  it "#my_attr_accessor methods really get and set" do
    obj.x = "xxx"
    obj.y = "yyy"

    expect(obj.x).to eq("xxx")
    expect(obj.y).to eq("yyy")
  end
end
