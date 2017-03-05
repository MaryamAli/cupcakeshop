require 'rails_helper'

describe UsersController, :type => :controller do

  let(:user) {FactoryGirl.create(:user)} 

  describe "GET #show" do
    context "User is logged in" do
      before do
        sign_in user
        request.host = 'cupcakeshop.herokuapp.com'
      end
      it 'loads correct user details' do
        get :show, id: user.id
        expect(response).to have_http_status(200)
        # binding.pry
        expect(assigns(:user)).to eq user
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