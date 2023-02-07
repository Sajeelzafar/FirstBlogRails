require 'rails_helper'

RSpec.describe 'Post Index Page', type: :system do
    before do
        @tom = User.create(
            name: 'Tom',
            photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
            bio: 'Teacher from Mexico.',
            posts_counter: 0
        )
        @post1 = Post.create(author: @tom, title: 'Hello', text: 'This is my first post', comments_counter: 1,
                      likes_counter: 1)
        @comment1 = Comment.create(post: @post1, author: @tom, text: 'Hi Tom!')
        @comment2 = Comment.create(post: @post1, author: @tom, text: 'Hi Jerry!')
        @comment3 = Comment.create(post: @post1, author: @tom, text: 'Hi Toons!')

    end

    it "should display the post title" do
        visit user_post_path(user_id: @tom.id, id: @post1.id)
        expect(page).to have_text(@post1.title)
    end

    it "should display the user who wrote the post" do
        visit user_post_path(user_id: @tom.id, id: @post1.id)
        expect(page).to have_text(@tom.name)
    end

    it "should display the number of comments that post has" do
        visit user_post_path(user_id: @tom.id, id: @post1.id)
        expect(page).to have_text("Comments: 4")
    end

    it "should display the number of likes that post has" do
        visit user_post_path(user_id: @tom.id, id: @post1.id)
        expect(page).to have_text("Likes: 1")
    end

    it "should display the post body" do
        visit user_post_path(user_id: @tom.id, id: @post1.id)
        expect(page).to have_text(@post1.text)
    end

    it "should display the username of each commentor" do
        visit user_post_path(user_id: @tom.id, id: @post1.id)
        expect(page).to have_text(@tom.name)
    end

    it "should display comment each user made" do
        visit user_post_path(user_id: @tom.id, id: @post1.id)
        expect(page).to have_content(@comment1.text)
        expect(page).to have_content(@comment2.text)
        expect(page).to have_content(@comment3.text)
    end
end