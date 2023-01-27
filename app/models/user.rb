class User < ApplicationRecord
    validates :name, presence: true,
    validates :photo, :presence: true,
    validates :bio, presence: true,
    has_many :comments, foreign_key: "author_id",
    has_many :posts, foreign_key: "author_id",
    has_many :likes, foreign_key: "author_id",

    def last_posts
        posts.last(3)
    end

end

