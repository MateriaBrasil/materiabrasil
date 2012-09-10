Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    key     = "372042392867868"
    secret  = "2e40d72fde9afa2ae45096fc5bab517c"
  else
    key     = ENV['FACEBOOK_KEY']
    secret  = ENV['FACEBOOK_SECRET']
  end
  provider :facebook, key, secret, scope: "email, user_about_me, user_location"
end
