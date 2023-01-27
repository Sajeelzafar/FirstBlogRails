class Post < ApplicationRecord
  after_create :increment_posts_counter
  validates :title, presence: true
  validates :author_id, numericality: { only_integer: true }
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  def increment_posts_counter
    author.increment!(:posts_counter)
  end

  def last_comments
    comments.last(5)
  end
end
