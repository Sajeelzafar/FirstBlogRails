class Post < ApplicationRecord
  after_create :increment_posts_counter
  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, numericality: { only_integer: true, greater_then_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_then_or_equal_to: 0 }
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  belongs_to :author, class_name: 'User'

  def increment_posts_counter
    author.increment!(:posts_counter)
  end

  def last_comments
    comments.last(5)
  end
end
