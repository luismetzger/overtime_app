class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(permitted_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post, notice: 'Your post was created successfully!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(permitted_params)
      redirect_to @post, notice: 'Your post was updated successfully!'
    else
      redirect_to :edit
    end
  end

  def destroy
    @post.delete
    redirect_to posts_path, notice: 'Your post was deleted successfully!'
  end

  def show
  end

  private

  def permitted_params
    params.require(:post).permit(:date, :rationale)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
