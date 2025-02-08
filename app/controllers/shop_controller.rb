class ShopController < ApplicationController
  def index
    items = [
      { id: 1, name: "Potion XP", price: 50 },
      { id: 2, name: "Booster XP", price: 100 },
      { id: 3, name: "Titre Spécial", price: 500 }
    ]
    render json: { items: items }
  end

  def purchase
    user = FirebaseService.get_user(1)  # Remplace par user connecté
    item_price = 50  # À récupérer dynamiquement

    if user.data["coins"] >= item_price
      new_coins = user.data["coins"] - item_price
      FirebaseService.update_user_coins(user.data["uid"], new_coins)
      render json: { message: "Achat réussi!", new_coins: new_coins }
    else
      render json: { error: "Fonds insuffisants!" }, status: :unprocessable_entity
    end
  end
end
