class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :signed_in?

  def current_user
    return nil unless session[:session_token]
    User.find_by_session_token(session[:session_token])
  end

  def signed_in?
    !!current_user
  end

  def sign_in(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def logout_current_user!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

  def require_current_user!
    redirect_to new_session_url unless signed_in?
  end

  def require_no_current_user!
    redirect_to user_url(current_user) if signed_in?
  end
end
