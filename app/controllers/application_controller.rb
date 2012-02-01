class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :operating_user
  helper_method :authenticate_user_or_admin!

  protected
  
  def authenticate_user_or_admin!
    if user_signed_in?
      @current_ability ||= Ability.new(current_user)
      return 
    elsif admin_signed_in?
      @current_ability ||= Ability.new(current_admin)
      return
    else
      authenticate_user!
    end
  end


  def operating_user
    @operating_user ||= current_admin || current_user
  end
end
