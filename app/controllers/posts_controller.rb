class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @current_user = User.first
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_path(current_user), notice: 'Post successfully created'
    else
      render :new, alert: 'Error creating new post'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
