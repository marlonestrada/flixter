class Course < ActiveRecord::Base
  belongs_to :user

  validates :title, :description, :cost, presence: { message: 'This field cannot be blank!' }
  validates :cost, numericality: { greater_than_or_equal_to: 0, message: 'The value must be greater than zero!' }
end
