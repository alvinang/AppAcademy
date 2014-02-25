class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_creds(params[:user][:email], params[:user][:password])
    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Invalid email or password"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  def password_reset_email
    user = User.find_by(email: params[:email])
    msg = UserMailer.password_email(user)
    msg.deliver!
    redirect_to new_session_url
  end

  def sign_in_email
    user = User.find_by(session_token: params[:session_token])
    login!(user) if !user.nil?
    redirect_to edit_user_url(user)
  end

end
