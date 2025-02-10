class ShopController < ApplicationController
  before_action :authenticate_user!

  def index
    items = [
      { id: 1, name: "Potion XP", price: 50 },
      { id: 2, name: "Booster XP", price: 100 },
      { id: 3, name: "Titre Spécial", price: 500 }
    ]
    render json: { items: items }
  end

  def create
    item = params[:item_id]
    price = { "1" => 50, "2" => 100, "3" => 500 }[item]

    if current_user.coins >= price
      current_user.update(coins: current_user.coins - price)
      render json: { message: "Achat réussi!" }
    else
      render json: { error: "Fonds insuffisants" }, status: :unprocessable_entity
    end
  end
end
