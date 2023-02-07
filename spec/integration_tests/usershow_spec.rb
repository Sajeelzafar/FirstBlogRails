require 'rails_helper'

RSpec.describe 'User Show Page', type: :system do
  before do
    @tom = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 0
    )
    @post1 = Post.create(author: @tom, title: 'Hello', text: 'This is my first post', comments_counter: 1,
                         likes_counter: 1)
    @post2 = Post.create(author: @tom, title: 'Hi', text: 'This is my second post', comments_counter: 1,
                         likes_counter: 1)
    @post3 = Post.create(author: @tom, title: 'Hi again', text: 'This is my third post', comments_counter: 1,
                         likes_counter: 1)
    @post4 = Post.create(author: @tom, title: 'Final words', text: 'This is my fourth post', comments_counter: 1,
                         likes_counter: 1)
  end
  it 'should display the username of selected user' do
    visit user_path(@tom.id)
    expect(page).to have_text(@tom.name)
  end
  it 'should display the profile picture of current user' do
    visit user_path(@tom.id)
    assert page.has_xpath?("//img[@src = 'https://unsplash.com/photos/F_-0BxGuVvo'
        and @alt='user photo']")
  end
  it 'should display the number of posts user has written' do
    visit user_path(@tom.id)
    expect(page).to have_text('Number of posts = 4')
  end
  it 'should display the bio user has written' do
    visit user_path(@tom.id)
    expect(page).to have_text(@tom.bio)
  end
  it "should display user's first 3 posts" do
    visit user_path(@tom.id)
    expect(page).to have_content(@post2.text)
    expect(page).to have_content(@post3.text)
    expect(page).to have_content(@post4.text)
  end
  it "should redirect to post's index page when see all posts clicked" do
    visit user_path(@tom.id)
    click_button 'See all posts'
    expect(page).to have_current_path user_posts_path(user_id: @tom.id)
  end
end
