class UsersController < ApplicationController
  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user, include: :items
    else
      render json: { status: 404 }, status: :not_found
    end
  end

  def new
    items = Item.create(item_params)
    render json: { status: 201 }
  end

  private

  def item_params
    params.permit(:name, :description, :price, :user)
  end
end
