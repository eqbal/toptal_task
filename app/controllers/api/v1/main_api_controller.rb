class Api::V1::MainApiController < Api::V1::BaseApiController

  def index
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {} }
  end
                       
end



