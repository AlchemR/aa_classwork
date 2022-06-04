class PostsController < ApplicationController

before_action :is_author?, only: [:edit, :update]

  def create
    @post = Post.new(post_params)
    if @post.save
    redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render:new
    end

  end

  def new
    @post = Post.new
    render:new
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def destroy
  post = Post.find_by(id: params[:id])
  post.destroy
  redirect_to sub_url(post)
  end

  def edit
    @post = Post.find_by(id: params[:id])
    redirect_to edit_post_url
  end

  def update
    @post = Post.find_by(id: params[:id])
      redirect_to edit_post_url
  end

  def is_author?
    @post = Post.find_by(id: params[:id])
    @post.author == current_user
    
    # self.author_id == current_user.id
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
  end


end
