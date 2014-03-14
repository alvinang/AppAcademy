module ApplicationHelper
  
  def current_user
    session_token = session[:session_token]
    return nil if session_token.nil?
    
    User.find_by_session_token(session_token)
  end
  
  def signed_in?
    !!current_user
  end
  
end
