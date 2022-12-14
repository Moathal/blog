require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'Name', post_counter: 30, photo: 'photo', bio: 'bio')
    @post = Post.create(title: 'My First Post', comments_counter: 4, likes_counter: 20, author_id: @user.id)
  end

  describe 'GET /index' do
    it 'http request returnes success and check correct placeholder text.' do
      get "/users/#{@post.author_id}/posts"
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('posts')
    end
  end

  describe 'GET /show' do
    it 'http request returns success and check correct placeholder text.' do
      get "/users/#{@post.author_id}/posts/#{@post.id}"
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('post')
    end
  end
end
