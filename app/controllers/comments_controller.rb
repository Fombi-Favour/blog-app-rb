class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(text: comment_params[:text], author_id: current_user.id, post_id: @post.id)

    if @comment.save
      redirect_to user_post_path(id: @post.id, user_id: @post.author_id), notice: 'Comment successfully created'
    else
      render :new, alert: 'Error creating new comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
