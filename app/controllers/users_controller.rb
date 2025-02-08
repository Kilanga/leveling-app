class UsersController < ApplicationController
  def show
    user = FirebaseService.get_user(params[:id])
    render json: { user: user.data }
  end

  def update
    user = FirebaseService.get_user(params[:id])
    updates = params.permit(:display_name, :avatar, :bio, :preferences)
    FirebaseService.update_user(user.data["uid"], updates)
    render json: { message: "Profil mis à jour", user: user.data.merge(updates) }
  end
end
