Fabricator(:answer) do
  user { User.order("RANDOM()").first }
  question { Question.order("RANDOM()").first }
  body  { Faker::Hacker.say_something_smart }
  best { [true,false].sample }
end