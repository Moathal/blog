require 'rails_helper'

RSpec.describe "Posts", type: :request do
  subject { Post.new(title: 'My First Post', comments_counter: 4, likes_counter: 20) }

  before { subject.save }

  describe "GET /index" do
    it 'http request returnes success and check correct placeholder text.' do
      get '/users/:author_id/posts'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('posts')
    end
  end

  describe 'GET /show' do
    it 'http request returns success and check correct placeholder text.' do
      get "/users/:author_id/posts/#{subject.id}"
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('post')
    end
  end
end
