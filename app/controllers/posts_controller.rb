class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  def index
    recent = params[:recent];
    if params[:post_index]
      post_index = params[:post_index];
    else
      post_index = true
    end
    if post_index
      @posts = Post.all
    else
      @user = User.find(params[:user_id])
      @posts = @user.posts
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to user_posts_path(current_user.id)
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def new
    if user_signed_in?
      @post = Post.new
    else
      redirect_to '/users/sign_in'
      @new
    end
  end
end
