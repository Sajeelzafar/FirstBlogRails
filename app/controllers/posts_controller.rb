class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id].to_i)
    @user_posts = Post.where(author: @user)
  end

  def show
    @post = Post.find(params[:id].to_i)
    @post_comments = Comment.where(post: @post)
  end

  def new
    @post = Post.new
  end

  def create
    @new_post = params.require(:post).permit(:title, :text)
    @post = Post.new(author: current_user, title: @new_post[:title], text: @new_post[:text], comments_counter: 0,
                     likes_counter: 0)
    if @post.save
      flash[:success] = 'Post created succefully!'
      redirect_to users_path
    else
      flash.now[:error] = "The post couldn't be created!"
    end
  end
end
