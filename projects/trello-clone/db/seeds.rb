# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# 
# Examples:
# 
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create!([
  {email: 'simis1000@gmail.com', password: 123}
])

boards = Board.create!([
  {title: "Home"}, #1
  {title: "Work"} #2
])

board_assignments = BoardAssignment.create!([
  {user_id: 1, board_id: 1},
  {user_id: 1, board_id: 2}
])

lists = List.create!([
  #Home: board 1
  {board_id: 1, rank: 1, title: "To Do", }, #1
  {board_id: 1, rank: 2, title: "Doing"}, #2
  {board_id: 1, rank: 3, title: "Done"}, #3
  #Work: board 2
  {board_id: 2, rank: 1, title: "Urgent", }, #4
  {board_id: 2, rank: 2, title: "Important"}, #5
  {board_id: 2, rank: 3, title: "Optional"} #6
])

cards = Card.create!([
  #To Do: List 1 on Home
  {list_id: 1, rank: 1, title: "Clean dishes"},
  {list_id: 1, rank: 2, title: "Mop kitchen"},
  #Doing: List 2 on Home
  {list_id: 2, rank: 1, title: "Fix back door"},
  #Done: List 3 on Home
  {list_id: 3, rank: 1, title: "Water plants"},
  {list_id: 3, rank: 2, title: "Fold sheets"},
  
  #Urgent: List 4 on Work
  {list_id: 4, rank: 1, title: "Prepare earnings spreadsheet"},
  {list_id: 4, rank: 2, title: "Build sales presentation"},
  #Important: List 5 on Work
  {list_id: 5, rank: 1, title: "Find new accountant"},
  {list_id: 5, rank: 2, title: "Look into bigger office space"},
  #Optional: List 6 on Work
  {list_id: 6, rank: 1, title: "Review workflows"},
  {list_id: 6, rank: 2, title: "Redecorate conference room"}
])