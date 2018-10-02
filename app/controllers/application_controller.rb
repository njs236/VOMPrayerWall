class ApplicationController < ActionController::Base

  
  protected
  

  
    
    def ensure_login
      return true if user_signed_in?
      session[:return_to] = request.fullpath
      redirect_to new_user_session_url and return false
    end
end
