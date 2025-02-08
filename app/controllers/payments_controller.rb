class PaymentsController < ApplicationController
  def create
    begin
      charge = Stripe::Charge.create(
        amount: 500, # 5€ en cents
        currency: 'eur',
        source: params[:stripeToken],
        description: "Achat de coins"
      )
      
      user = FirebaseService.get_user(1) # Remplace par user connecté
      new_coins = user.data["coins"] + 100
      FirebaseService.update_user_coins(user.data["uid"], new_coins)
      
      flash[:notice] = "Achat réussi! 100 coins ajoutés."
    rescue Stripe::CardError => e
      flash[:alert] = e.message
    end
    redirect_to root_path
  end
end
