class SessionsController < ApplicationController

  def new
    render:new
  end

  def create
    debugger  
  @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
  if @user
      login!(@user)
      redirect_to users_url 
    else
      redirect_to users_url
    end
  end

  def destroy
    logout!
    redirect_to users_url
  end

end
