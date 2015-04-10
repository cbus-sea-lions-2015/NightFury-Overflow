Fabricator(:comment) do
  commentable { [ (Question.order("RANDOM()").first),(Answer.order("RANDOM()").first)].sample }
  commentable_type { |attrs| attrs[:commentable].class.to_s }
  user { User.order("RANDOM()").first }
  body  { Faker::Company.bs }
end