class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    if user_signed_in?
      @comment = Comment.new
    else
      redirect_to '/users/sign_in'
    end
  end

  def create
    @user = @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author_id = current_user.id
    if params[:comment_submit]
      if @comment.save
        flash[:notice] = 'Comment created successfully!'
      else
        flash[:alert] = 'Error creating comment'
      end
    end
    redirect_to user_post_path(@user, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
