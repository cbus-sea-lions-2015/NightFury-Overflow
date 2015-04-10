<<<<<<< HEAD
User.create!(email:"night@fury.fury",password:"1234")
10.times { Fabricate(:user) }
20.times { Fabricate(:question) }
50.times { Fabricate(:answer) }
50.times { Fabricate(:comment) }
500.times { Fabricate(:vote) }

=======
15.times { Fabricate(:user) }
50.times { Fabricate(:question) }
100.times { Fabricate(:answer) }
100.times { Fabricate(:comment) }
300.times { Fabricate(:vote) }
>>>>>>> 3ffd0acfa3f0c2144cba0675a8993e8bcd5e3821
