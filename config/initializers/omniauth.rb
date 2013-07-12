Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    key     = "143298045807277"
    secret  = "8922faec9e9e604e890a6f04cb718e8c"
  else
    key     = ENV['FACEBOOK_KEY']
    secret  = ENV['FACEBOOK_SECRET']
  end
  provider :facebook, key, secret, scope: "email, user_about_me, user_location"
end
