class Comment < ApplicationRecord
  after_create :increment_comments_counter
  validates :text, presence: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  def increment_comments_counter
    post.increment!(:comments_counter)
  end
end
