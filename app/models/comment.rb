class Comment < ApplicationRecord
  after_create :increment_comments_counter
  validates :text, presence: true
  validates :author_id, numericality: { only_integer: true }
  validates :post_id, numericality: { only_integer: true }
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def increment_comments_counter
    post.increment!(:comments_counter)
  end
end
