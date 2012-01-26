class Ticket < ActiveRecord::Base
  belongs_to :user
  has_many :activities, :dependent => :destroy
  
  validate :title, :presence => true

end
