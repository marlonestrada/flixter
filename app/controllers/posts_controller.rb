class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def new
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @topic.posts.create(post_params.merge({:user_id => current_user.id}))
    redirect_to topic_path(@topic)
  end

  def show
    @post = Post.find(params[:id])
    @replies = @post.replies
    @reply = Post.new(:original_post_id => @post.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
