Fabricator(:user) do
  email { Faker::Internet.email }
  name { Faker::Name.name }
  password { "1234" }
  location { Faker::Address.country }
  age { Faker::Number.number(2) }
end