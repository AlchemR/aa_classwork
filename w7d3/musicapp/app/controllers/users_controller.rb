class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
      
  end

  def index
    @users = User.all
    render:index
  end

  def show

    render :show
  end

  def create
  @user = User.create(self.params.require(:user).permit(:email, :password))
    
  if @user.save!
      login!
      redirect_to user_url(@user)
    else
      render:new
    end
  end



end
