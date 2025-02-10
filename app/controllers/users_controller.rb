class UsersController < ApplicationController
    before_action :authenticate_user!
    def show
      user = User.find(params[:id])
      render json: { user: user }
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Utilisateur non trouvé" }, status: :not_found
    end
  def update
    user = FirebaseService.get_user(params[:id])
    updates = params.permit(:display_name, :avatar, :bio, :preferences)
    FirebaseService.update_user(user.data["uid"], updates)
    render json: { message: "Profil mis à jour", user: user.data.merge(updates) }
  end
end
