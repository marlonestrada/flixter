class Course < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :sections
  has_many :enrollments
  has_many :comments
  has_many :topics
  before_create :build_topic

  validates :title, :description, :cost, presence: { message: 'This field cannot be blank!' }
  validates :cost, numericality: { greater_than_or_equal_to: 0, message: 'The value must be greater than zero!' }

  def free?
    cost.zero?
  end

  def premium?
    !free?
  end

  private

  def build_topic
    self.topics.build(:name => "General Questions")
  end
end
