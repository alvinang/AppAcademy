# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a1 = Article.create!(title: 'Sample Article Title', body: 'This is the text for my article')
a2 = Article.create!(title: 'Title2', body: 'Text2')
a3 = Article.create!(title: 'Title3', body: 'Test3')
