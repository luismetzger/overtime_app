class PostsController < ApplicationController
  before_action :find_post, only: [:show]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(permitted_params)

    if @post.save
      redirect_to @post, notice: 'Your post was created successfully!'
    else
      render :new
    end
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
