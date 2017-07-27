class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to root_path
    else
      flash.now[:alert] = "Something wrong! Please check the form!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Update failed.  Please check the form."
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
