class User < ApplicationRecord
  validates :name, presence: true
  validates :photo, presence: true
  validates :bio, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def last_posts
    posts.last(3)
  end
end
