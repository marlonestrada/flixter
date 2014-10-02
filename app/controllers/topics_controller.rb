class TopicsController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.find(params[:course_id])
    @topic = @course.topics.new
  end

  def create
    @course = Course.find(params[:course_id])
    @course.topics.create(topic_params)
    redirect_to topics_path
  end

  def show
    @topic = Topic.find(params[:id])
    @post = Post.new
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end
end
