class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrolled_in_current_course

  def show
    @course = Lesson.find(params[:id]).section.course
    @posts = @course.latest_posts
  end

  private

  def require_enrolled_in_current_course
    if !current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_path(current_lesson.section.course), alert: 'Please enroll in the course to watch the lessons.'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end

# select p.* from courses c join sections s on s.course_id = c.id join lessons l on l.section_id = s.id
#   join topics t on t.course_id = c.id join posts p on p.topic_id = t.id group by p.id;

#   Category.joins(posts: [{comments: :guest}, :tags])
