# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




user = User.create(username: 'kevin')
user1 = User.create(username: 'phil')


user.contacts.create(name: 'john', email: 'example@example.com')
user.contacts.create(name: 'allen', email: 'anotherexample@example.com')

user1.contacts.create(name: 'rick', email: 'example@example.com')
user1.contacts.create(name: 'roll', email: 'anotherexample@example.com')


