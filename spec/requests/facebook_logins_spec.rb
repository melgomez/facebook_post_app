require 'rails_helper'

RSpec.describe "Facebook Authentication", type: :request do

  describe "login" do
    it "displays user_id when successful" do
      
      mock_auth_hash
      # visit signin_path provider: 'facebook'
      visit 'auth/facebook'
      # expect(current_uri).to root_path
      expect(page).to have_content("Logged user_id: 1")
    end
  end
end
