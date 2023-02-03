require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it "should have a valid users page" do
      get users_path
      expect(response).to have_http_status(200)
    end

    it "should render the correct users page" do
      get users_path
      expect(response).to render_template(:index)
    end
    
    it "should render the correct response body text in users page" do
      get users_path
      expect(response.body).to include("This is the Users page")
    end

    it "should have a valid user_id page" do
      get user_path(id: 1)
      expect(response).to have_http_status(200)
    end

    it "should render the correct user_id page" do
      get user_path(id: 1)
      expect(response).to render_template(:show)
    end

    it "should render the correct response body text in user_id page" do
      get user_path(id: 1)
      expect(response.body).to include("This is the Users page and currently you have selected 1 user ID.")
    end
  end
end
