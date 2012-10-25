# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



role = Role.create(name: "admin")
role = Role.create(name: "facturista")

user = User.create(username:"saulo" email:"saulo@hotmail.com", password: "123123", password_confirmation: "123123"
)
user = User.create(username:"miguel" email: "miguel@gmail.com", password: "123123", password_confirmation: "123123")

user_role = user.add_role(user_id: "1", role_id:"1")
user_role = user.add_role(user_id: "2", role_id:"1")

