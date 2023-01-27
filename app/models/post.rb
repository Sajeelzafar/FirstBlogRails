class Post < ApplicationRecord
  after_create :increment_posts_counter
  validates :text, presence: true
  validates :title, presence: true
  validates :author_id, numericality: { only_integer: true }
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  def increment_posts_counter
    author.increment!(:posts_counter)
  end

  def last_comments
    comments.last(5)
  end
end
