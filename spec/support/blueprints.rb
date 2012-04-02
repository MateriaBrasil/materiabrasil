require 'machinist/active_record'


AdminUser.blueprint do
  username { "user#{sn}@email.com" }
  password { "fake_password" }
end


Category.blueprint do
  name { "Name #{sn}" }
  code_reference { 1 }
  parent
end

Manufacturer.blueprint do
  name { "Manufaturer #{sn}" }
  site { "http://mysite#{sn}.com" }
end

Material.blueprint do
  resume { "This is a resume #{sn}" }
  manufacturer
  technical_observation { "Some technical observation" }
  density     { sn }
  dimensions  { sn }
  packing     { sn }
  average_price { sn}
end
