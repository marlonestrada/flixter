class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  belongs_to :original_post, :class_name => 'Post'
  has_many :replies, :class_name => 'Post', :foreign_key => 'original_post_id'
  scope :latest_posts_for_course, ->(course_id) { joins(topic: {course: :sections}).where('courses.id = ?', course_id).order(created_at: :desc).limit(3) }
end

