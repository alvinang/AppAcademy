module SessionsHelper
  def require_login!
    redirect_to new_session_url unless current_user
  end
end
