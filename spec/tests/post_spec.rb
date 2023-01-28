require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Sajeel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Sajeel.',
                     posts_counter: 2)
  post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 1,
                     likes_counter: 1)
  comment1 = Comment.create(post:, author: user, text: 'Hi Tom!')

  it 'Should have not have more than 250 characters' do
    post.title = 'supercajafajalysticxpldoshiassupercajafajalysticxpldoshias
    supercajafajalysticxpldoshiassupercajafajalysticxpldoshiassupercajafajalysticxpldoshias
    supercajafajalysticxpldoshiassupercajafajalysticxpldoshiassupercajafajalysticxpldoshias
    supercajafajalysticxpldoshiassupercajafajalysticxpldoshias'
    expect(post).to_not be_valid
  end

  it 'Name must be present' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'Should contain numeric value for author_id' do
    post.author_id = 'hello'
    expect(post).to_not be_valid
  end

  it 'Should increment counter by 1' do
    expect(user.posts_counter).to eq(3)
  end

  it 'Should have comments counter greater than or equal to zero' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'Should have likes counter greater than or equal to zero' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end

  it 'latest_comment should return last comment' do
    expect(post.last_comments).to include(comment1)
  end

  it 'Should display the last three comments done by subject' do
    comment2 = Comment.create(post:, author: user, text: 'Hi Jerry!')
    comment3 = Comment.create(post:, author: user, text: 'Hi Sajeel!')
    comment4 = Comment.create(post:, author: user, text: 'Hi Saira!')
    comment5 = Comment.create(post:, author: user, text: 'Hi Cake!')
    comment6 = Comment.create(post:, author: user, text: 'Hi Raphael!')
    comments = post.last_comments
    expect(comments).to match_array([comment2, comment3, comment4, comment5, comment6])
  end
end
