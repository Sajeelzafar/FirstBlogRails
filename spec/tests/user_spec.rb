require_relative '../rails_helper'

RSpec.describe User, type: :model do
  subject = User.create(name: 'Sajeel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Sajeel.',
                        posts_counter: 1)
  post1 = Post.create(author: subject, title: 'Hello', text: 'This is my first post', comments_counter: 1,
                      likes_counter: 1)

  it 'Name must be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Should have posts counter greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Should contain a link to photo' do
    subject.photo = nil
    expect(subject).to_not be_valid
  end

  it 'Should contain bio' do
    subject.bio = nil
    expect(subject).to_not be_valid
  end

  it 'latest_posts should return last post' do
    expect(subject.last_posts).to include(post1)
  end

  it 'Should display the last three posts done by subject' do
    post2 = Post.create(author: subject, title: 'Hi', text: 'This is my second post', comments_counter: 1,
                        likes_counter: 1)
    post3 = Post.create(author: subject, title: 'Hi again', text: 'This is my third post', comments_counter: 1,
                        likes_counter: 1)
    post4 = Post.create(author: subject, title: 'Final words', text: 'This is my fourth post', comments_counter: 1,
                        likes_counter: 1)
    posts = subject.last_posts
    expect(posts).to match_array([post2, post3, post4])
  end
end
