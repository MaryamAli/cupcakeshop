require 'rails_helper'

describe UsersController, :type => :controller do
  context "When a new user is created" do
    
    # before do
      let(:user)  {User.create!(email: "new@user.com", password: "newpassword")}
      let(:user2) {User.create!(email: "new2@user.com", password: "newpassword2")}
    # end
    describe "GET #show" do
      context "User is logged in" do
        before do
          sign_in user
          request.host = 'cupcakeshop.herokuapp.com'
        end
        it 'loads correct user details' do
          get :show, id: user.id
          expect(response).to be_success
          expect(response).to have_http_status(200)
          expect(assigns(:user)).to eq user
        end

        it 'doesn\'t allow 1st user to see show page of 2nd user' do
          get :show, id: user2.id
          # expect(response).not_to be_valid
          expect(response).to have_http_status(302)
          expect(response).to redirect_to('http://cupcakeshop.herokuapp.com/')
        end

      end

      context "No user is logged in" do
        it 'redirects to login' do
          get :show, id: user.id
          expect(response).to redirect_to('/login')
        end
      end

    end

  end

end