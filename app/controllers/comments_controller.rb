class CommentsController < ApplicationController
  def new
    if user_signed_in?
      @comment = @comments = Comment.new
    else
      redirect_to '/users/sign_in'
      @new
    end
  end

  def create
    @current_post = Post.find(params[:post_id])
    @comments = @current_post.comments.new(comment_params)
    @comments.post_id = @current_post.id
    @comments.author_id = current_user.id
    if @comments.save
      redirect_to "/users/#{@current_post.author.id}/posts/#{@current_post.id}"
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
