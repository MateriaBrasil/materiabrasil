OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
  provider: "facebook",
  uid: "12345",
  info: {
    name: "Luiz Fonseca",
    email: "runeroniek@gmail.com",
    location: "Rio de Janeiro"
  }
)
