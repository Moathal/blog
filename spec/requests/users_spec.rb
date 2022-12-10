require 'rails_helper'

RSpec.describe "Users", type: :request do
  subject { User.new(name: 'John', post_counter: 30, photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.') }

  before { subject.save }
  describe "GET /index" do
    it "http request returns success and check correct placeholder text." do
      get "/"
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("users")
    end
  end

  describe "GET /show" do
    it "http request returns success and check correct placeholder text." do
      get "/users/#{subject.id}"
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("user")
    end
  end
end
