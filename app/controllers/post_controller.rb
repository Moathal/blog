class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @posts = Post.find(params[:id])
    end

    def new
        @posts = Post.new
    end
end