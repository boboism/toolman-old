# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'admin', :email => 'eam@gacmotor.com', :password => 'gamc2010@', :password_confirmation => 'gamc2010@'
puts 'New user created: ' << user.name
user2 = User.create! :name => '101048', :email => 'sujb@gacmotor.com', :password => '123456', :password_confirmation => '123456'
puts 'New user created: ' << user2.name
user.add_role :admin
