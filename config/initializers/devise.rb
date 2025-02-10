Devise.setup do |config|
  require "omniauth-google-oauth2"

  # Email utilisé par Devise pour envoyer des notifications
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"

  # Configuration de l'ORM
  require "devise/orm/active_record"

  # Configuration des clés de connexion
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]

  # Stockage des sessions
  config.skip_session_storage = [ :http_auth ]

  # Longueur du mot de passe
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # Permet l'accès sans confirmation immédiate pendant 2 jours
  config.allow_unconfirmed_access_for = 2.days

  # Réinitialisation du mot de passe
  config.reset_password_within = 6.hours

  # Expiration des sessions après une période d'inactivité
  # config.timeout_in = 30.minutes

  # Déconnexion via DELETE
  config.sign_out_via = :delete

  # Configuration OmniAuth Google avec redirect_uri
  config.omniauth :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {
    scope: "email,profile",
    prompt: "select_account",
    image_aspect_ratio: "square",
    image_size: 150,
    redirect_uri: "http://localhost:3000/users/auth/google_oauth2/callback"
  }

  # Autoriser uniquement les requêtes POST pour OmniAuth
  OmniAuth.config.allowed_request_methods = [ :post ]

  # Désactiver l'avertissement sur les requêtes GET pour OmniAuth
  OmniAuth.config.silence_get_warning = true

  # Configuration Hotwire/Turbo
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other
end
