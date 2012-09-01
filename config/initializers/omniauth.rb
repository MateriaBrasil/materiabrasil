Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    key, secret     = "372042392867868", "2e40d72fde9afa2ae45096fc5bab517c"
  else
    key, secret     = ENV['KEY_FACEBOOK'], ENV['SECRET_FACEBOOK']
  end
  provider :facebook, key, secret, scope: "email, user_about_me, user_location, offline_access"
end
