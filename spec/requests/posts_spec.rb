require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it "should have a valid posts page" do
      get user_posts_path(user_id: 5)
      expect(response).to have_http_status(200)
    end

    it "should have a valid post id page" do
      get user_post_path(user_id: 5, id: 2)
      expect(response).to have_http_status(200)
    end
  end
end
