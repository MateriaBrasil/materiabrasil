require 'machinist/active_record'

AdminUser.blueprint do
  email { "user#{sn}@email.com" }
  password { "fake_password" }
end


Category.blueprint do
  name { "Name #{sn}" }
  code_reference { 1 }
end

Manufacturer.blueprint do
  name { "Manufaturer #{sn}" }
  site { "http://mysite#{sn}.com" }
  email { "manu#{sn}@manufacturer.com" }
end

Material.blueprint do
  name { "Name #{sn}" }
  resume { "This is a resume #{sn}" }
  manufacturer
  technical_observation { "Some technical observation" }
  density     { sn }
  dimensions  { sn }
  average_price { sn }
  images(3)
  categories(1)
end

Image.blueprint do
  title { "Title #{sn}" }
  description { "Desc #{sn}" }
  featured { true }
  image { File.open("#{Rails.root}/spec/support/fixtures/image1.png") }
end

Authorization.blueprint do
  # Attributes here
end

User.blueprint do
  name { "Test User#{sn}" }
  email { "test#{sn}@user.com" }
  password { 'password' }
  password_confirmation { 'password' }
  newsletter { true }
end
