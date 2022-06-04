class SessionsController < ApplicationController
  before_action :require_logged_out, only: [:new, :create]
  def new
    @user = User.new
    render :new
  end

  def create #find user, login user, redirect -- OR display (custom) errors for why it didnt login and redirect to new sesion URL
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login(@user)
      redirect_to users_url
    else 
      flash[:errors] = ['Credentials invalid']
      redirect_to new_session_url
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

end