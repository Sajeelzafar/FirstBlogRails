require_relative '../rails_helper'

RSpec.describe Comment, type: :model do
    user = User.create(name: 'Sajeel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Sajeel.', posts_counter: 2)
    post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 1, likes_counter: 1)
    comment1 = Comment.create(post: post, author: user, text: 'Hi Tom!' )
    

    it 'Comment must be present' do
        comment.text = nil
        expect(post).to_not be_valid
    end

    it 'Should increment counter by 1' do
        expect(post.comments_counter).to eq(2)
    end
end