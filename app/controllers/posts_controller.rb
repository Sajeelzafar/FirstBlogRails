class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id].to_i)
    @user_posts = Post.where(author: @user)
  end

  def show
    params
  end
end
