class SubsController < ApplicationController
  
  before_action :is_mod?, only: [:edit, :update]

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
    render:new
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end


  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  def update
    redirect_to subs_url unless is_mod?
    @sub = Sub.find_by(id: params[:id])
    
  end

  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end

  def is_mod?
    @sub = Sub.find_by(id: params[:id])
    @sub.moderator == current_user

    # self.moderator_id == current_user.id
  end

end
