# encoding: utf-8
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'admin', :email => 'eam@gacmotor.com', :password => 'gamc2010@', :password_confirmation => 'gamc2010@'
puts 'New user created: ' << user.name
user2 = User.create! :name => '101048', :email => 'sujb@gacmotor.com', :password => '123456', :password_confirmation => '123456'
puts 'New user created: ' << user2.name
user.add_role :admin

puts 'SETTING UP DEFAULT ENGINE MODEL'
eng1 = EngineModel.create! :name => '201', :description => 'AC 2.0VTML'
eng2 = EngineModel.create! :name => '181', :description => 'AC 1.8VTML'
eng3 = EngineModel.create! :name => '185', :description => 'AE 1.8混合动力'
eng4 = EngineModel.create! :name => '161', :description => 'P5 1.6DCVVT'
eng5 = EngineModel.create! :name => '203', :description => 'P3 2.0DCVVT'
eng6 = EngineModel.create! :name => '182', :description => 'P4 1.8T'
puts 'New engine models created'

puts 'SETTING UP DEFAULT PRODUCT LINE'
prdline1 = ProductLine.create! :name => '缸体'
prdline2 = ProductLine.create! :name => '缸盖'
prdline3 = ProductLine.create! :name => '曲轴'
puts 'New product lines created'
