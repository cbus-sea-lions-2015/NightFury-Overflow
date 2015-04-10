Fabricator(:question) do
  user { User.order("RANDOM()").first }
  title { Faker::Company.catch_phrase }
  body  { Faker::Company.bs }
end