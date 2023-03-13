class LikesController < ApplicationController
  def new
    if user_signed_in?
      @like = Like.new
    else
      redirect_to '/users/sign_in'
    end
  end

  def create
    if user_signed_in?
      @post = Post.find(params[:post_id])
      @like = already_liked
      if @like.nil?
        @like = @post.likes.new
        @like.author_id = current_user.id
        @like.post_id = @post.id
        if @like.save
          redirect_to user_post_path(current_user, @post)
        else
          render :new
        end
      else
        destroy_like(@like, @post)
        redirect_to user_post_path(current_user, @post)
      end
    else
      redirect_to '/users/sign_in'
    end
  end

  def already_liked
    Like.find_by(author_id: current_user.id, post_id:
    params[:post_id])
  end

  def destroy_like(like, post)
    like.destroy
    like.save
    post.update(likes_counter: post.likes.count)
    post.save
  end
end
