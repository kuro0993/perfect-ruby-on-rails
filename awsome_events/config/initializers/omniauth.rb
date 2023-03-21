Rails.application.config.middleware.use OmniAuth::Builder do
  # if Rails.env.development? || Rails.env.test?
    # provider :github, "YOUR_CLIENT_ID", "YOUR_CLIENT_SERCRET"
  # else
    # provider :github,
      # Rails.application.credentials.github[:client_id],
      # Rails.application.credentials.github[:client_secret]
  # end
  provider :github,
    Rails.application.credentials.github[:client_id],
    Rails.application.credentials.github[:client_secret]
end
