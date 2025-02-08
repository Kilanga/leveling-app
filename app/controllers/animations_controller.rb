class AnimationsController < ApplicationController
  ANIMATIONS = [
    { id: 1, title: "Effet de montée en niveau", description: "Une animation s'affiche à chaque montée de niveau" },
    { id: 2, title: "Effet d'accomplissement de quête", description: "Animation lorsque vous complétez une quête" },
    { id: 3, title: "Effet spécial boutique", description: "Lumière scintillante sur les objets achetés" }
  ]

  def index
    render json: { animations: ANIMATIONS }
  end
end
