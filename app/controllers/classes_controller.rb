class ClassesController < ApplicationController
  before_action :authenticate_user!
  def index
    current_class = current_user.class_progression&.class_name || "Novice"
    render json: { current_class: current_class }
  end

  def update
    next_class = ClassProgression.where("level_required <= ?", current_user.level).order(level_required: :desc).first
    if next_class
      current_user.update(class_progression: next_class)
      render json: { message: "Évolution réussie!", new_class: next_class.class_name }
    else
      render json: { error: "Aucune évolution disponible" }, status: :unprocessable_entity
    end
  end
end
