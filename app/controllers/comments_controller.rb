class CommentsController < ApplicationController
  before_action :authenticate_blogger!
  def new
    if blogger_signed_in?
      @comment = Comment.new
    else
      redirect_to '/bloggers/sign_in'
    end
  end

  def create
    @blogger = @blogger = Blogger.find(params[:blogger_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author_id = current_blogger.id
    if params[:comment_submit]
      if @comment.save
        flash[:notice] = 'Comment created successfully!'
      else
        flash[:alert] = 'Error creating comment'
      end
    end
    redirect_to blogger_post_path(@blogger, @post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @post.comments_counter -= 1
    @post.save
    @comment.destroy
    redirect_to blogger_post_path(@post.author, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
