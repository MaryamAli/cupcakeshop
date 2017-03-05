require 'rails_helper'

describe ProductsController, :type => :controller do
  context 'GET #index' do
    before do
      get :index
    end

    it 'responds successfully with an HTTP 200 status' do
      expect(response).to have_http_status(200)
    end

    it 'renders all of the products' do
      expect(response).to render_template('index')
    end 

  end

  let (:product) {FactoryGirl.create(:product)}

  describe ProductsController do
    context "Show single product"
      it 'shows one product and its comments' do
        get :show, id: product.id
        # binding.pry
        expect(assigns(:product)).to eq product
      end
    end
  
    context "Test for create action"
      it 'creates product with all of the validations' do
        # get :show, id: product.id
        # # binding.pry
        # expect(product).to eq product
        # post '/products/new'
        # expect(response).to redirect_to (assigns(:product))

        # expect(response).to render_template(:show)
        # expect(response.body).to include("Product was successfully created.")
        @product = FactoryGirl.build(:product)
      # binding.pry
      expect(@product).to be_valid
      end
    end

    context "Test for create action fail" do
      it 'creates nil  product with all of the validations' do

        @product = Product.new(:name=>'blah',:description=>'desc',
          :image_url=>'img',:colour=>nil,:price=>12)

      expect(@product.save).to eql false
      #expect(response).not_to be_valid
      # binding.pry 
        
        #get :show, id: product.id
        # expect(response).to render_template(:new)
        #binding.pry
        # this passes:
        # expect(Product.new).to be_a_new(Product)

        @product.colour=nil
        #post '/products/new'
        post '/products/new'
        #expect(assigns(:product)).to be_a_new(Product)
        # get :show, id: product.id
        expect(response).not_to be_valid
        # binding.pry
        expect(response).to redirect_to (assigns(:product))

        expect(response).to render_template(:show)
        expect(response.body).to include("prohibited this product from being saved")
      end
    # end
  end
   
      # it '' do
      #   #expect(response) FAIL for validation error etc
      # end
    # end
    
    # context "Test for update action"
      # it '' do
        #expect(response) update success
      # end

      # it '' do
        #expect(response) update fail
      # end
    # end

    # context "Test for delete"
      # it '' do
      #   expect(response) destroy (removed from database)
      # end
    # end 
  # end  



