class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.includes(:posts).find(params[:user_id].to_i)
    @posts = Post.includes(:comments, :likes).where(author_id: @user.id)
  end

  def show
    @post = Post.includes(:comments, :likes).find(params[:id])
    authorize! :read, @post
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.comments.destroy_all
    @post.likes.destroy_all
    @post.destroy
    redirect_to user_posts_path(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
