require 'rails_helper'

describe UsersController, :type => :controller do
  context "When a new user is created" do
    
    before do
      @user = User.create!(email: "new@user.com", password: "newpassword")
    end
    describe "GET #show" do
      context "User is logged in" do
        before do
          sign_in @user
        end
        it 'loads correct user details' do
          get :show, id: @user.id
          expect(response).to be_success
          expect(response).to have_http_status(200)
          expect(assigns(:user)).to eq @user
        end

      end

      context "No user is logged in" do
        it 'redirects to login' do
          get :show, id: @user.id
          expect(response).to redirect_to('/login')
        end
      end

    end

  end

end