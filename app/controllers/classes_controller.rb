class ClassesController < ApplicationController
  CLASSES = ["Novice", "Guerrier", "Mage", "Assassin", "Paladin", "Maître"]

  def index
    user = FirebaseService.get_user(1) # Remplacer par utilisateur connecté
    current_class = CLASSES[user.data["level"] / 10] || CLASSES.last
    render json: { current_class: current_class }
  end

  def update
    user = FirebaseService.get_user(1) # Remplacer par utilisateur connecté
    new_class = CLASSES[(user.data["level"] / 10) + 1] || CLASSES.last
    FirebaseService.update_user_class(user.data["uid"], new_class)
    render json: { message: "Évolution réussie!", new_class: new_class }
  end
end
