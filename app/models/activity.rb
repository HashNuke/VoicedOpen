class Activity < ActiveRecord::Base
  belongs_to :actable, :polymorphic => true
  belongs_to :ticket
end
