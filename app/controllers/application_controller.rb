class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  #helper_method :current_user
  
  #def current_user
    #@current_user ||= User.find(session[:user_id]) if session[:user_id]
 #end
  
  
  
  def require_user
    if !signed_in?
      flash[:danger] = "You must be logged in to do that."
      redirect_to root_path
    end
  end
  
  def require_admin
    if !current_user.admin?
      flash[:danger] = "You must be an admin to do that."
      redirect_to home_path
    end
  end
  
end
