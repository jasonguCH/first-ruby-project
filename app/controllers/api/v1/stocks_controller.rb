class Api::V1::StocksController < ApplicationController
  def index
    @stocks = Stock.all
    render json: @stocks
  end

  def create
    @stock = Stock.new(
      product_id: params[:product_id],
      store_id: params[:store_id],
      quantity: params[:quantity]
    )
    if @stock.save
      render json: @stock
    else
      render json: { error: @stock.errors.full_messages }, status: 400
    end
  end

  def show
    @stock = Stock.find_by(id: params[:id])
    unless @stock
      return render json: { error: "Stock not found" }, status: 404
    end
    render json: @stock
  end

  def update
    @stock = Stock.find_by(id: params[:id])
    unless @stock
      return render json: { error: "Stock not found" }, status: 404
    end
    @stock.update(
      product_id: params[:product_id],
      store_id: params[:store_id],
      quantity: params[:quantity]
    )
    render json: @stock
  end

  def destroy
    @stock = Stock.find_by(id: params[:id])
    unless @stock
      return render json: { error: "Stock not found" }, status: 404
    end
    @stock.destroy
    render json: @stock
  end

  def restock
    # cover param to integer
    time = params[:quantity].to_i
    RestockJob.set(wait: time.second).perform_later(params.permit(:product_id, :store_id, :quantity))
    render json: { message: "Restock job created" }, status: 200
  end

  private

  def stock_params
    params.require(:stock).permit(:product_id, :store_id, :quantity)
  end

end
