require 'rails_helper'

describe ProductsController, :type => :controller do

  context 'GET #index' do
    let!(:product_1) { Product.create(name: "blue bike", description: "two wheels", image_url:"bike.jpg", colour: "blue", price: "5") }
    let!(:product_2) { Product.create(name: "red bike", description: "two wheels", image_url:"bike.jpg", colour: "red", price: "5") }
    let!(:product_3) { Product.create(name: "green bike", description: "two wheels", image_url:"bike.jpg", colour: "green", price: "5") }

    it 'responds successfully with an HTTP 200 status' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
      expect(assigns[:products].to_a).to eql([product_1, product_2, product_3])
    end

    it 'renders all of the products' do
      get :index, params: { q: 'red' }
      expect(assigns[:products].to_a).to eql([product_2])
    end
  end

  let (:product) {FactoryGirl.create(:product)}
  let(:user) { FactoryGirl.create(:user)}
  let(:admin) { FactoryGirl.create(:admin) }
  context "Show single product" do
    it 'shows one product and its comments' do
      get :show, id: product.id
      # binding.pry
      expect(assigns(:product)).to eq product
    end
  end

  context "Test for product update action" do
    before do
      sign_in admin
    end
    it 'tests for admin status before allowing product update' do
      get :edit, params: {id: product.id}
      expect(response).to have_http_status(200)
    end

    it 'tests for admin status prior to allowing product delete' do
      delete :destroy, params:{id: product.id}
      expect(response).to redirect_to(products_path)
    end

    it 'fails product update if missing a validation' do
      get :edit, params: {id: product.id}
      @product = Product.update(:name=>'blah',:description=>'desc',
        :image_url=>'img',:colour=>nil,:price=>12)
      expect(response).to_not render_template(:show)       
    end
  end

  context "Test for create action" do
    before do
      sign_in user
    end
    it 'creates product with all of the validations' do
      @product = FactoryGirl.build(:product)
      get :new
      # binding.pry
      expect(response).to have_http_status(200)
    end

    it 'fails product creation if missing a validation' do
      @product = Product.new(:name=>'blah',:description=>'desc',
        :image_url=>'img',:colour=>nil,:price=>12)
      get :new

      expect(@product.save).to eql false
    end
  end 
end



