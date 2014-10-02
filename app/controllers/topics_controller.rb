class TopicsController < ApplicationController
  def index
    @courses = Course.all
    @topic = Topic.new
  end

  # def create
  #   @course = Course.find([params[:id]])
  #   @course.topics.create(topics_params)
  #   redirect_to topics_path
  # end

  def show
    @topic = Topic.find(params[:id])
    @post = Post.new
  end
end
