require 'rails_helper'
RSpec.describe 'User Index Page', type: :system do
  before do
    @tom = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 3
    )
    @lilly = User.create(
      name: 'Lilly',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Poland.',
      posts_counter: 0
    )
  end
  it 'should display the username of all other users' do
    visit users_path
    expect(page).to have_text(@tom.name)
  end
  it 'should display the profile picture of all users' do
    visit users_path
    assert page.has_xpath?("//img[@src = 'https://unsplash.com/photos/F_-0BxGuVvo'
        and @alt='user photo']")
  end
  it 'should display the number of posts students have written' do
    visit users_path
    expect(page).to have_text('Number Of Posts: 3')
  end
  it "should redirect to user's show page when user clicked" do
    visit users_path
    click_on 'Tom'
    expect(page).to have_current_path user_path(@tom)
  end
end
