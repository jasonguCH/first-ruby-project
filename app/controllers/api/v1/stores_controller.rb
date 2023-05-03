class Api::V1::StoresController < ApplicationController
  def index
    @stores = Store.all
    render json: @stores
  end

  def create
    @store =  Store.new(
      name: params[:name],
      location: params[:location]
    )
    if @store.save
      render json: @store
    else
      render json: {error: @store.errors.full_messages}, status: 400
    end
  end

  def show
    @store = Store.find_by(id: params[:id])
    unless @store
      return render json: {error: "Store not found"}, status: 404
    end
    render json: @store
  end

  def update
    @store = Store.find_by(id: params[:id])
    unless @store
      return render json: {error: "Store not found"}, status: 404
    end
    @store.update(
      name: params[:name],
      location: params[:location]
    )
    render json: @store
  end

  def destroy
    @store = Store.find_by(id: params[:id])
    unless @store
      return render json: {error: "Store not found"}, status: 404
    end
    @store.destroy
    render json: @store
  end

  private

  def store_params
    params.require(:store).permit(:name, :location, :address, :description)
  end
end
