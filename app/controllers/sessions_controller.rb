class SessionsController < ApplicationController
  require 'googleauth'
  require 'firebase_admin'

  def create
    token = params[:token]
    decoded_token = FirebaseAdmin::Auth.verify_id_token(token)
    uid = decoded_token['uid']
    user = FirebaseService.get_user(uid)

    if user.exists?
      render json: { message: 'Connexion réussie', user: user.data }, status: :ok
    else
      user = FirebaseService.create_user(uid, decoded_token['email'], decoded_token['name'])
      render json: { message: 'Utilisateur créé', user: user }, status: :created
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unauthorized
  end
end
