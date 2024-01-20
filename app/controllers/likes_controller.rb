class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(author_id: current_user.id, post_id: @post.id)

    return unless @like.save

    redirect_to user_post_path(id: @post.id, user_id: @post.author_id), notice: '👍'
  end
end
