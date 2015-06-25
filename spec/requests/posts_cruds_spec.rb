require 'rails_helper'

RSpec.describe "POSTS CRUDS", type: :request do
  describe "get index" do
    it "should show the Users.posts" do
      get posts_cruds_path
      expect(response).to have_http_status(200)
    end
  end
end
