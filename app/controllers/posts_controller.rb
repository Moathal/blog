class PostsController < ApplicationController
  before_action :authenticate_blogger!, except: %i[index show]
  def index
    if params[:post_index].present?
      @posts = Post.all.order(likes_counter: :desc)
    else
      @id = Blogger.find(params[:blogger_id])
      @posts = Post.where(author_id: @id)
    end
  end

  def show
    @post = Post.find(params[:id])
    @blogger = Blogger.find(params[:blogger_id])
    like = Like.find_by(author_id: @blogger.id)
    @liked = like.nil?
    @comments = @post.comments
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_blogger.id
    if @post.save
      redirect_to blogger_posts_path(current_blogger.id)
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def new
    if blogger_signed_in?
      @post = Post.new
    else
      redirect_to '/bloggers/sign_in'
      @new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @user = Blogger.find(@post.author_id)
    @user.post_counter -= 1
    @user.save
    redirect_to "/bloggers/#{current_blogger.id}/posts"
  end
end
