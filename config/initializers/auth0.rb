Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    ENV['auth0_client_id'],
    ENV['auth0_client_secret'],
    ENV['auth0_domain'],
    callback_path: '/auth/auth0/callback',
    authorize_params: {
      scope: 'openid email profile'
    }
  )
end
