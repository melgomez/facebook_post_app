require 'rails_helper'

RSpec.describe "Facebook Authentication", type: :request do

  describe "login" do
    it "displays user_id when successful" do
      mock_auth_hash
      visit 'auth/facebook'

      expect(current_url).to eq( posts_url )
      # expect(page).to have_content("Logged in user_id: 1")
    end

    it "should add new post" do
     mock_auth_hash
     visit 'auth/facebook'
     visit new_post_path
     expect(current_url).to eq( new_post_url )
    end
  end

  describe "login fails" do
  	it "redirects to the root path" do
  		visit posts_path
  		expect( current_url ).to eq( root_url )
  		expect(page).to have_content("Please log in.")
  	end
  end
end