# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#<Cat id: nil, age: nil, birth_date: nil, color: nil, name: nil, sex: nil, created_at: nil, updated_at: nil>
# Colors = %w(calico black white brown green)
Cat.create( age: 10, color: "calico", name: "Fluffy", sex: "F", user_id: 1)
Cat.create( age: 20, color: "white", name: "Whiskers", sex: "M", user_id: 1)
Cat.create( age: 2, color: "black", name: "Athena", sex: "F", user_id: 1)
Cat.create( age: 50, color: "green", name: "Ajax", sex: "M", user_id: 1)
Cat.create( age: 3, color: "calico", name: "Python", sex: "F", user_id: 1)
Cat.create( age: 4, color: "white", name: "Ruby", sex: "M", user_id: 2)
Cat.create( age: 7, color: "black", name: "Rails", sex: "F", user_id: 2)
Cat.create( age: 6, color: "black", name: "Django", sex: "M", user_id: 2)
Cat.create( age: 999, color: "brown", name: "Wordpres", sex: "F", user_id: 2)
Cat.create( age: 999999, color: "brown", name: "Gizmo", sex: "F", user_id: 2)

#<CatRentalRequest id: nil, cat_id: nil, start_date: nil, end_date: nil, status: nil, created_at: nil, updated_at: nil>

CatRentalRequest.create(cat_id: 1, start_date: "2014-02-04", end_date: "2014-02-04", status: "PENDING")

CatRentalRequest.create(cat_id: 1, start_date: "2014-02-05", end_date: "2014-02-08", status: "PENDING")
CatRentalRequest.create(cat_id: 1, start_date: "2014-02-06", end_date: "2014-02-09", status: "PENDING")
CatRentalRequest.create(cat_id: 1, start_date: "2014-02-05", end_date: "2014-02-07", status: "PENDING")
