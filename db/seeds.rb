#users

sarah = User.create(username: "Sarah", email: "sarah@test.com", run_goal: 20, password: "test")
jane = User.create(username: "Jane", email: "jane@test.com", run_goal: 25, password: "test")

#runs
sarah.runs.create(distance: 2, time: 20, shoes: "Nike Pegasus Zoom 35", notes: "Tiring", indoor_outdoor: "Indoor")
jane.runs.create(distance: 1, time: 12, shoes: "Nike React", notes: "Great, ready for more!", indoor_outdoor: "Outdoor")
