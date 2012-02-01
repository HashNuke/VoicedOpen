class User < ActiveRecord::Base
  has_many :tickets,    :as => :ticketable
  has_many :activities, :as => :actable

  validates_presence_of :first_name
  validates_presence_of :last_name
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :remember_me
end
