class BloggersController < ApplicationController
  def index
    @bloggers = Blogger.all.order(post_counter: :desc)
  end

  def show
    if params[:id] == 'sign_out'
      sign_out current_blogger
      redirect_to root_path
    else
      @blogger = Blogger.find(params[:id])
    end
  end

  def new
    @bloggers = Blogger.new
  end
end
