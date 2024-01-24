class ProductsController < ApplicationController
  def index
    @products = Product.all

    render json: @products.as_json, status: :ok
  end

  def create
    @product = Product.create!(product_params)

    render json: @product.as_json, status: :created
  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end

  def update
    product.update!(product_params)

    render json: @product.as_json, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end

  def destroy
    product.destroy!

    render json: { message: 'Product deleted' }, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end

  private

  def product_params
    params
      .require(:product)
      .permit(:name, :description, :price)
  end

  def product
    @product ||= Product.find(params[:id])
  end
end
