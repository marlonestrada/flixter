class RepliesController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @reply = @post.replies.build
  end

  def create
    @post = Post.find(params[:post_id])
    @post.replies.create(post_params.merge({:user_id => current_user.id}))
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
