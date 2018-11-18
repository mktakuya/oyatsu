class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items
  end

  def show
    @item = Item.find(params[:id])
    render json: @item
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item, status: 201
    else
      render json: { errors: @item.errors.full_messages }
    end
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      render json: @item
    else
      render json: { errors: @item.errors.full_messages }
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      render nil, status: 204
    else
      render json: { errors: @item.errors.full_messages }, status: 400
    end
  end

  private

  def item_params
    params.permit(
      :name,
      :quantity
    )
  end
end
