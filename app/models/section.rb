class Section < ActiveRecord::Base
  belongs_to :course
  has_many :lessons

  include RankedModel
  ranks :row_order, with_same: :course_id

  def next_section
    course.sections.where("row_order > ?", self.row_order).rank(:row_order).first
  end

  def previous_section
    course.sections.where("row_order < ?", self.row_order).rank(:row_order).last
  end
end
