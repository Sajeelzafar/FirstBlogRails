require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index/:user_id/posts' do
    it "should have a valid posts page" do
      get user_posts_path(user_id: 5)
      expect(response).to have_http_status(200)
    end

    it "should render the correct posts page" do
      get user_posts_path(user_id: 5)
      expect(response).to render_template(:index)
    end

    it "should render the correct response body text in posts page" do
      get user_posts_path(user_id: 5)
      expect(response.body).to include("This is the Posts page")
    end

    it "should have a valid post id page" do
      get user_post_path(user_id: 5, id: 2)
      expect(response).to have_http_status(200)
    end

    it "should render the correct post_id page" do
      get user_post_path(user_id: 5, id: 2)
      expect(response).to render_template(:show)
    end

    it "should render the correct response body text in post_id page" do
      get user_post_path(user_id: 5, id: 2)
      expect(response.body).to include("This is the Posts page and currently you have selected 2 Post ID.")
    end
  end
end
