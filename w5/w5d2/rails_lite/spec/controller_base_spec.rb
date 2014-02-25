require 'webrick'
require 'rails_lite'

describe ControllerBase do
  before(:all) do
    class UsersController < ControllerBase
      def index
      end
    end
  end

  let(:req) { WEBrick::HTTPRequest.new(:Logger => nil) }
  let(:res) { WEBrick::HTTPResponse.new(:HTTPVersion => '1.0') }
  let(:users_controller) { UsersController.new(req, res) }

  describe "#render_content" do
    before(:each) do
      users_controller.render_content "somebody", "text/html"
    end

    it "sets the response content type" do
      users_controller.res.content_type.should == "text/html"
    end

    it "sets the response body" do
      users_controller.res.body.should == "somebody"
    end

    describe "#already_rendered?" do
      let(:users_controller2) { UsersController.new(req, res) }
      it "is false before rendering" do
        users_controller2.already_rendered?.should be_false
      end

      it "is true after rendering content" do
        users_controller2.render_content "sombody", "text/html"
        users_controller2.already_rendered?.should be_true
      end

      it "raises an error when attempting to render twice" do
        users_controller2.render_content "sombody", "text/html"
        expect {
        users_controller2.render_content "sombody", "text/html"
        }.to raise_error
      end
    end
  end

  describe "#redirect" do
    before(:each) do
      users_controller.redirect_to("http://www.google.com")
    end

    it "sets the header" do
      users_controller.res.header["location"].should == "http://www.google.com"
    end

    it "sets the status" do
      users_controller.res.status.should == 302
    end

    describe "#already_rendered?" do
      let(:users_controller2) { UsersController.new(req, res) }
      it "is false before rendering" do
        users_controller2.already_rendered?.should be_false
      end

      it "is true after rendering content" do
        users_controller2.redirect_to("http://google.com")
        users_controller2.already_rendered?.should be_true
      end

      it "raises an error when attempting to render twice" do
        users_controller2.redirect_to("http://google.com")
        expect do
          users_controller2.redirect_to("http://google.com")
        end.to raise_error
      end
    end
  end

  describe "#render" do
    before(:each) do
      users_controller.render(:index)
    end

    it "renders the html of the index view" do
      users_controller.res.body.should include("users")
      users_controller.res.body.should include("<h1>")
      users_controller.res.content_type.should == "text/html"
    end

    describe "#already_rendered?" do
      let(:users_controller2) { UsersController.new(req, res) }
      it "is false before rendering" do
        users_controller2.already_rendered?.should be_false
      end

      it "is true after rendering content" do
        users_controller2.render(:index)
        users_controller2.already_rendered?.should be_true
      end

      it "raises an error when attempting to render twice" do
        users_controller2.render(:index)
        expect do
          users_controller2.render(:index)
        end.to raise_error
      end
    end
  end
end
