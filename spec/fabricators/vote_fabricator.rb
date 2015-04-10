Fabricator(:vote) do
  votable { [ (Question.order("RANDOM()").first),(Answer.order("RANDOM()").first)].sample }
  votable_type { |attrs| attrs[:votable].class.to_s }
  user { User.order("RANDOM()").first }
  best { [true,false].sample }
  value { [1,-1].sample }
end