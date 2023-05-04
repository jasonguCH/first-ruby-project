class Api::V1::ProductsController < ApplicationController

  def index
    @products = Product.all
    render json: @products
  end

  def create
    @product = Product.create(product_params)
    if @product.valid?
      render json: @product, status: 201
    else
      render json: { error: "Product not created" }, status: 400
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    unless @product
      return render json: { error: "Product not found" }, status: 404
    end
    render json: @product
  end

  def update
    @product = Product.find_by(id: params[:id])
    unless @product
      return render json: { error: "Product not found" }, status: 404
    end
    @product.update(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      brand: params[:brand]
    )
    render json: @product
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    unless @product
      return render json: { error: "Product not found" }, status: 404
    end
    @product.destroy
    render json: @product
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :brand)
  end
end
