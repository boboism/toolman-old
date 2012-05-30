class User < ActiveRecord::Base
	rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :nickname
  # attr_accessible :title, :body



  has_many :tunning_work_orders, :class_name => :TunningWorkOrder, :foreign_key => :doc_user_id
  has_many :scrap_orders, :class_name => :ScrapOrder, :foreign_key => :doc_user_id


  
  def to_str
    "#{nickname || name}"
  end
  alias to_s to_str
  alias to_label to_str
end
