class Setting < ActiveRecord::Base

  def to_param
    self.slug
  end
  
end
