class LikesController < ApplicationController
  def new
    if blogger_signed_in?
      @like = Like.new
    else
      redirect_to '/bloggers/sign_in'
    end
  end

  def create
    if blogger_signed_in?
      @post = Post.find(params[:post_id])
      if params[:create].present?
        @like = @post.likes.new
        @like.author_id = current_blogger.id
        @like.post_id = @post.id
        if @like.save
          redirect_to blogger_post_path(current_blogger, @post)
        else
          render :new
        end
      else
        @like = Like.find_by(author_id: current_blogger.id)
        destroy_like(@like, @post)
      end
    else
      redirect_to '/bloggers/sign_in'
    end
  end

  def destroy_like(like, post)
    like.destroy
    like.save
    post.likes_counter -= 1
    post.save
    redirect_to blogger_post_path(@post.author, @post)
  end
end
