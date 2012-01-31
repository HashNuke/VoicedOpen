class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :operating_user

  def operating_user
    @operating_user ||= current_admin || current_user
  end
    
end
