class LikesController < ApplicationController
  before_action :authenticate_user!

  def new
    if user_signed_in?
      @like = Like.new
    else
      redirect_to '/users/sign_in'
    end
  end

  def create
      @post = Post.find(params[:post_id])
      @like = @post.likes.new
      @like.author_id = current_user.id
      @like.post_id = @post.id
      if @like.save
        redirect_to user_post_path(current_user, @post)
      else
        render :new
      end
  end
end
