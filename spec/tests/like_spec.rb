require_relative '../rails_helper'

RSpec.describe Like, type: :model do
    user = User.create(name: 'Sajeel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Sajeel.', posts_counter: 2)
    post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 1, likes_counter: 1)
    like = Like.create(post: post, author: user)
    
    it 'Should increment counter by 1' do
        expect(post.likes_counter).to eq(2)
    end
end