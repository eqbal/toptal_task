require 'spec_helper'

describe Admin::UsersController do

  before (:each) do
    # @user = create(:admin, email: "my@email.com", username: 'test')
    @user = User.create({:username => 'username', :password => 'password', :password_confirmation => 'password', :email => 'myemail@mail.com'})    
    sign_in @user
  end

  describe "GET 'show'" do
    
    it "should be successful" do
      get :show, :id => @user.id
      expect(response).to be_success      
    end
    
    it "should find the right user" do
      get :show, :id => @user.id
      assigns(:user).should == @user
    end
    
  end

end


