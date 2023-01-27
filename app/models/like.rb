class Like < ApplicationRecord
    after_create :increment_likes_counter
    validates :post_id, numericality: { only_integer: true },
    validates :author_id, numericality: { only_integer: true },
    belongs_to :author, class_name: "User",
    belongs_to :post

    def increment_likes_counter
        post.increment!(:likes_counter)
    end
end