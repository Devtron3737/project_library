# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username: "sven")
User.create!(username: "devin")
User.create!(username: "chris")
User.create!(username: "jordan")
User.create!(username: "kanye")
User.create!(username: "jay-z")
User.create!(username: "mchammer")

Contact.create!(email: "todd@stuff", user_id: 1, name: "todd" )
Contact.create!(email: "muchelle@stuff", user_id: 2, name: "michelle" )
Contact.create!(email: "drevil@stuff", user_id: 3, name: "drevil" )
Contact.create!(email: "sandra@stuff", user_id: 1, name: "sandra" )
Contact.create!(email: "pookie@stuff", user_id: 4, name: "pookie" )

ContactShare.create!(contact_id: 1, user_id: 1)
ContactShare.create!(contact_id: 2, user_id: 1)
ContactShare.create!(contact_id: 3, user_id: 2)
ContactShare.create!(contact_id: 3, user_id: 1)
ContactShare.create!(contact_id: 4, user_id: 4)
