
User.create!(email:"night@fury.fury",password:"1234")
10.times { Fabricate(:user) }
20.times { Fabricate(:question) }
50.times { Fabricate(:answer) }
50.times { Fabricate(:comment) }
500.times { Fabricate(:vote) }

