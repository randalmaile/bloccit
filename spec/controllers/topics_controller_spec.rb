require 'spec_helper'

## The controller spec is broken down by controller method

## Think of the spec as an outline

describe TopicsController do
  before :each do
    @user = create(:user)
    @topic_public = create(:topic, public: true)
    @topic_private = create(:topic, public: false)
  end

  describe "GET #index" do 
    it "renders the :index template" do
      get :index
      response.should render_template :index
    end
    context "user signed-out" do
      it "returns a collection of public topics" do
        get :index
        assigns(:topics).should eq([@topic_public])
      end
    end

    context "user signed-in" do
      before :each do
        sign_in(@user)
      end
      it "returns a collection of private topics" do
        get :index
        assigns(:topics).should eq([@topic_public, @topic_private])
      end
    end
  end
end
