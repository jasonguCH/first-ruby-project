require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET index' do
    before do
      Product.destroy_all
      FactoryBot.create_list(:product, 10)
      get '/api/v1/products/'
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'return all products' do
      expect(json.size).to eq(10)
    end
    after do
      Product.destroy_all
    end
  end
end

RSpec.describe 'Products', type: :request do
  describe 'GET show' do
    before do
      Product.destroy_all
      @product = FactoryBot.create(:product)
      get '/api/v1/products/' + @product.id.to_s
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'returns the correct product' do
      expect(@product.id).to eq(JSON.parse(response.body)['id'])
    end
    after do
      Product.destroy_all
    end
  end
end

RSpec.describe 'Products', type: :request do
  describe 'POST create' do
    context 'with valid parameters' do
      let!(:product_params) do
        { product: {
          name: "Test",
          price: 100,
          description: 'test',
          brand: 'test'
        }
        }
      end
      before do
        post '/api/v1/products/', params: product_params
      end
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
      it 'creates a new product' do
        expect(Product.count).to eq(1)
      end
      # it 'returns the product price' do
      #   expect(json['price']).to eq(product_params[:price])
      # end
      # it 'returns the product description' do
      #   expect(json(json)['description']).to eq(product_params[:description])
      # end
      # it 'returns the product brand' do
      #   expect(json(json)['brand']).to eq(product_params[:brand])
      # end
    end
    context 'with invalid parameters' do
      before do
        post '/api/v1/products/', params: {}
        it 'returns a 400' do
          expect(response).to have_http_status(400)
        end
      end
    end
  end

end