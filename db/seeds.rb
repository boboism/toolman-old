# encoding: utf-8
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'admin', :email => 'eam@gacmotor.com', :password => '123456', :password_confirmation => '123456'
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

puts 'SETTING UP DEFAULT CATEGORY'
category1 = Category.create! :name => '刃具'
category2 = Category.create! :name => '刀片'
category3 = Category.create! :name => '刀盘'
category4 = Category.create! :name => '刀柄'
category5 = Category.create! :name => '配件'
category6 = Category.create! :name => '测头'
category7 = Category.create! :name => '金属加工液'
puts 'New Categories created'

puts 'SETTING UP FACILITY TYPE'
factype1 = FacilityType.create! :name => '加工中心'
factype2 = FacilityType.create! :name => '转塔'
factype3 = FacilityType.create! :name => '专机'
factype4 = FacilityType.create! :name => '清洗机'
factype5 = FacilityType.create! :name => '珩磨机'
factype6 = FacilityType.create! :name => '内铣床'
factype7 = FacilityType.create! :name => '拉床'
factype8 = FacilityType.create! :name => '磨床'
factype9 = FacilityType.create! :name => '车床'
factype10 = FacilityType.create! :name => '抛光机'
factype11 = FacilityType.create! :name => '动平衡机'
factype12 = FacilityType.create! :name => '滚压机'
factype13 = FacilityType.create! :name => '淬火机'
puts 'New facility types created'

puts 'SETTING UP FACILITY CODE'
faccode1 = FacilityCode.create! :name => '单机'
faccode2 = FacilityCode.create! :name => 'A'
faccode3 = FacilityCode.create! :name => 'B'
faccode4 = FacilityCode.create! :name => 'C'
puts 'New Facility Code created'

puts 'SETTING UP WORKSHOP PROCESS'
workproc1 = WorkshopProcess.create! :name => 'OP010'
workproc2 = WorkshopProcess.create! :name => 'OP020'
workproc3 = WorkshopProcess.create! :name => 'OP030'
workproc4 = WorkshopProcess.create! :name => 'OP040'
workproc5 = WorkshopProcess.create! :name => 'OP050'
workproc6 = WorkshopProcess.create! :name => 'OP060'
workproc7 = WorkshopProcess.create! :name => 'OP070'
workproc8 = WorkshopProcess.create! :name => 'OP080'
workproc9 = WorkshopProcess.create! :name => 'OP090'
workproc10 = WorkshopProcess.create! :name => 'OP100'
workproc11 = WorkshopProcess.create! :name => 'OP110'
workproc12 = WorkshopProcess.create! :name => 'OP120'
workproc13 = WorkshopProcess.create! :name => 'OP130'
workproc14 = WorkshopProcess.create! :name => 'OP140'
workproc15 = WorkshopProcess.create! :name => 'OP150'
workproc16 = WorkshopProcess.create! :name => 'OP160'
workproc17 = WorkshopProcess.create! :name => 'OP170'
workproc18 = WorkshopProcess.create! :name => 'OP180'
workproc19 = WorkshopProcess.create! :name => 'OP190'
workproc20 = WorkshopProcess.create! :name => 'OP200'
workproc21 = WorkshopProcess.create! :name => 'OP210'
workproc22 = WorkshopProcess.create! :name => 'OP220'
workproc23 = WorkshopProcess.create! :name => 'OP230'
workproc24 = WorkshopProcess.create! :name => 'OP240'
workproc25 = WorkshopProcess.create! :name => 'OP250'
workproc26 = WorkshopProcess.create! :name => 'OP260'
workproc27 = WorkshopProcess.create! :name => 'OP270'
workproc28 = WorkshopProcess.create! :name => 'OP280'
workproc29 = WorkshopProcess.create! :name => 'OP290'
workproc30 = WorkshopProcess.create! :name => 'OP300'
workproc31 = WorkshopProcess.create! :name => 'OP310'
workproc32 = WorkshopProcess.create! :name => 'OP320'
puts 'New workshop processes created'

puts 'SETTING UP SUBCATEGORY'
subcat1 = SubCategory.create! :name => '直钻'
subcat2 = SubCategory.create! :name => '阶梯钻'
subcat3 = SubCategory.create! :name => '铰刀'
subcat4 = SubCategory.create! :name => '阶梯铰刀'
subcat5 = SubCategory.create! :name => '刀片'
subcat6 = SubCategory.create! :name => '抛光带'
subcat7 = SubCategory.create! :name => '丝锥'
subcat8 = SubCategory.create! :name => '立铣刀'
subcat9 = SubCategory.create! :name => '扩刀/锪刀'
subcat10 = SubCategory.create! :name => '中心钻'
subcat11 = SubCategory.create! :name => '拉刀'
subcat12 = SubCategory.create! :name => '珩磨条'
subcat13 = SubCategory.create! :name => '片铣刀'
subcat14 = SubCategory.create! :name => '毛刷'
subcat15 = SubCategory.create! :name => '高精度弹簧夹头刀柄'
subcat16 = SubCategory.create! :name => '液压刀柄'
subcat17 = SubCategory.create! :name => '侧压刀柄'
subcat18 = SubCategory.create! :name => '面铣刀柄'
subcat19 = SubCategory.create! :name => '强力刀柄'
subcat20 = SubCategory.create! :name => 'ER弹簧夹头刀柄'
subcat21 = SubCategory.create! :name => '丝锥刀柄'
subcat22 = SubCategory.create! :name => '镗刀柄'
subcat23 = SubCategory.create! :name => '非标刀柄'
subcat24 = SubCategory.create! :name => '毛刷刀柄'
subcat25 = SubCategory.create! :name => '测头刀柄'
subcat26 = SubCategory.create! :name => '丝锥快换夹头'
subcat27 = SubCategory.create! :name => '丝锥接杆'
subcat28 = SubCategory.create! :name => '加长接杆'
subcat29 = SubCategory.create! :name => '钻头快换接杆'
subcat30 = SubCategory.create! :name => '弹簧夹套'
subcat31 = SubCategory.create! :name => '螺母/螺帽'
subcat32 = SubCategory.create! :name => '变径套'
subcat33 = SubCategory.create! :name => '锁紧螺钉'
subcat34 = SubCategory.create! :name => '冷却管'
subcat35 = SubCategory.create! :name => '调整螺钉'
subcat36 = SubCategory.create! :name => '压块'
subcat37 = SubCategory.create! :name => '密封圈'
subcat38 = SubCategory.create! :name => '刀垫'
subcat39 = SubCategory.create! :name => '刀匣'
subcat40 = SubCategory.create! :name => '扳手'
puts 'New subcategories created'

puts 'SETTING UP MANUFACTURER'
manfac1 = Manufacturer.create! :name => '钴领'
manfac2 = Manufacturer.create! :name => '大连富士'
manfac3 = Manufacturer.create! :name => 'OSG'
manfac4 = Manufacturer.create! :name => '山高'
manfac5 = Manufacturer.create! :name => '肯纳'
manfac6 = Manufacturer.create! :name => '三菱'
manfac7 = Manufacturer.create! :name => '泰珂洛'
manfac8 = Manufacturer.create! :name => '住友'
manfac9 = Manufacturer.create! :name => '戴贝尔'
manfac10 = Manufacturer.create! :name => '杨蝶'
manfac11 = Manufacturer.create! :name => '嘉兴恒锋'
manfac12 = Manufacturer.create! :name => '速奈'
manfac13 = Manufacturer.create! :name => '名古屋'
manfac14 = Manufacturer.create! :name => 'NAGEL'
manfac15 = Manufacturer.create! :name => '赫根赛特'
manfac16 = Manufacturer.create! :name => '丰田万磨'
manfac17 = Manufacturer.create! :name => '泰利莱'
manfac18 = Manufacturer.create! :name => '3M'
manfac19 = Manufacturer.create! :name => '玛帕'
manfac20 = Manufacturer.create! :name => '山特维克'
manfac21 = Manufacturer.create! :name => '东莞东隆'
manfac22 = Manufacturer.create! :name => 'NT'
manfac23 = Manufacturer.create! :name => 'NT-ENGINE'
manfac24 = Manufacturer.create! :name => 'EFD'
manfac25 = Manufacturer.create! :name => '尤希路'
manfac26 = Manufacturer.create! :name => 'BP-嘉实多'
manfac27 = Manufacturer.create! :name => '美孚'
puts 'New manfacturers created'

puts 'SETTING UP AGENCY'
agency1 = Agency.create! :name => '钴领'
agency2 = Agency.create! :name => '大连富士'
agency3 = Agency.create! :name => 'OSG'
agency4 = Agency.create! :name => '肯纳'
agency5 = Agency.create! :name => '力丰'
agency6 = Agency.create! :name => '尚亚'
agency7 = Agency.create! :name => '山善'
agency8 = Agency.create! :name => '戴贝尔'
agency9 = Agency.create! :name => '杨蝶'
agency10 = Agency.create! :name => '爱铺斯'
agency11 = Agency.create! :name => '速奈'
agency12 = Agency.create! :name => 'NAGEL'
agency13 = Agency.create! :name => '赫根赛特'
agency14 = Agency.create! :name => '泰利莱'
agency15 = Agency.create! :name => '玛帕'
agency16 = Agency.create! :name => '东莞东隆'
agency17 = Agency.create! :name => 'EFD'
agency18 = Agency.create! :name => '尤希路'
