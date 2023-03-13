class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  def index
    if params[:post_index].present?
      @posts = Post.all
    else
      @id = User.find(params[:user_id])
      @posts = Post.where(author_id: @id)
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
