class Admin < ActiveRecord::Base

  has_many :tickets,    :as => :ticketable
  has_many :activities, :as => :actable
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :bushido_authenticatable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :ido_id, :first_name, :last_name

  def bushido_authenticatable(extra_attributes)
    self.first_name = extra_attributes["first_name"]
    self.last_name  = extra_attributes["last_name"]
    self.locale     = extra_attributes["locale"]
  end
end
