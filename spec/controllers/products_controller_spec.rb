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

    it '' do
      #expect(response) SHOW + comments
    end

    it '' do
      #expect(response) create successfully 
    end

    it '' do
      #expect(response) FAIL for validation error etc
    end

    it '' do
      #expect(response) update success
    end

    it '' do
      #expect(response) update fail
    end

    it '' do
      #expect(response) destroy (removed from database)
    end

  end
end