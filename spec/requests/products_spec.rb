require 'rails_helper'

RSpec.describe "Products", type: :request do
  let(:response_data) { JSON.parse(response.body, symbolize_names: true) }
  let(:token) { create(:token) }
  let(:product_params) do
    {
      product: {
        name: "Taladro",
        price: 1000,
        description: "Taladro multiusos"
      }
    }
  end
  let(:headers) { { "Authorization": "Bearer #{token.token}" } }
  let!(:products) { create_list(:product, 10) }

  describe "/products" do
    it "POST #create" do
      post products_path, params: product_params, headers: headers

      expect(response).to have_http_status(:success)
      expect(response_data[:name]).to eq(product_params[:product][:name])
      expect(Product.last.name).to eq(product_params[:product][:name])
    end

    it "GET #index" do
      get products_path, headers: headers

      expect(response).to have_http_status(:success)
      expect(response_data.size).to eq(10)
    end
  end

  describe "/products/:id" do
    it "PUT #update" do
      put product_path(products.first), params: product_params, headers: headers

      expect(response_data[:name]).to eq(product_params[:product][:name])
      expect(products.first.reload.name).to eq(product_params[:product][:name])
    end

    it "DELETE #destroy" do
      delete product_path(products.first), headers: headers

      expect(response).to have_http_status(:success)
      expect(Product.count).to eq(9)
    end
  end
end
