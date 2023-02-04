class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id].to_i)
    @user_posts = @user.last_posts
  end
end
