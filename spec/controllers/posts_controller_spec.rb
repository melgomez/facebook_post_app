require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  context 'when logged in' do
    
    before :each do
      user = create(:user)
      post = create(:post, user: user)
      sign_in(user)
    end
   
    describe 'GET index' do
      it "retrieves all User.posts" do
        get :index
        expect(current_user.posts.count).to eq(1)
        
      end
    end
     
    describe 'GET show' do
      it "retrieves a single entry" do
        get :show, :id => 1
        expect(assigns(:post).status).to eq("MyText 1")
      end
    end
    
    describe 'PATCH update' do
      it "updates post attributes" do
        patch :update, :id => current_user.posts.last.id, post: { :published => true }
        expect(assigns(:post).published).to eq(true)
      end
    end
    
    describe 'POST create' do
      it "increments the data record by one" do
        expect{
          post :create, post: attributes_for(:post)
        }.to change(Post, :count).by(1)
      end
    end
    describe 'DELETE destroy' do
      it "deletes data record on the database" do
        delete :destroy, :id => 1
        expect(flash[:notice]).to eq("Post was successfully destroyed.")
      end
    end
  end
  
end
