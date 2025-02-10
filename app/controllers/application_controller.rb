class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    dashboard_index_path # Utilise la route correcte
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path # Redirige vers la page d'accueil après déconnexion
  end
end
