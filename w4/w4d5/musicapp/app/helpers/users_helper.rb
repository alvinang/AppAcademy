module UsersHelper
  
  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])    
  end
  
  def logged_in?
    !!current_user
  end
  
  def login!(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end
  
  def logout!(user)
    session[:session_token] = nil
    user.reset_session_token!
  end
  
end
