# deprecated in favor of Rails 4 stuff
# require 'active_record_lite/01_mass_object'
#
# # Use these if you like.
# describe MassObject do
#   before(:all) do
#     class EmptyMassObject < MassObject
#     end
#
#     class MyMassObject < MassObject
#       my_attr_accessor :x, :y
#
#       # removed during upgrade to rails 4
#       # my_attr_accessible :x, :y
#     end
#   end
#
#   it "::attributes starts out empty" do
#     expect(EmptyMassObject.attributes).to be_empty
#   end
#
#   it "::attriburtes cannot be called directly on MassObject" do
#     expect {
#       MassObject.attributes
#     }.to raise_error("must not call #attributes on MassObject directly")
#   end
#
#   # removed during upgrade to rails 4
#   # it "::my_attr_accessible sets self.attributes" do
#   #   expect(MyMassObject.attributes).to eq([:x, :y])
#   # end
#
#   it "#initialize performs mass-assignment" do
#     obj = MyMassObject.new(:x => "xxx", :y => "yyy")
#
#     expect(obj.x).to eq("xxx")
#     expect(obj.y).to eq("yyy")
#   end
#
#   it "#initialize doesn't mind string keys" do
#     obj = MyMassObject.new("x" => "xxx", "y" => "yyy")
#
#     expect(obj.x).to eq("xxx")
#     expect(obj.y).to eq("yyy")
#   end
#
#
#   # removed during upgrade to rails 4
#   # it "#initialize rejects unregistered keys" do
#   #   expect {
#   #     obj = MyMassObject.new(:z => "zzz")
#   #   }.to raise_error("mass assignment to unregistered attribute 'z'")
#   # end
# end
