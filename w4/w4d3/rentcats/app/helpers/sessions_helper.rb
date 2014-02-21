module SessionsHelper

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= Session.find_by_token(session[:session_token]).user
  end

  def signed_in?
    !!current_user
  end

  def login_user!(user)
    @current_user = user
    session[:session_token] = find_token_by_user_and_device(@current_user).reset_session_token!
  end

  def find_token_by_user_and_device(user)
    device_info = ua.device.operating_system.type
    session_token = Session.where(user_id: user.id, device: device_info)
  end

  def direct_away_from_login
    redirect_to root_url if current_user
  end

  def is_owner?
    redirect_to root_url unless current_user.id == Cat.find_by_id(params[:id]).owner.id
    true
  end

end