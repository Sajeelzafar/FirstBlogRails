class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id].to_i)
    @user_posts = Post.where(author: @user)
  end

  def show
    @post = Post.find(params[:id].to_i)
    @post_comments = Comment.where(post: @post)
  end
end
