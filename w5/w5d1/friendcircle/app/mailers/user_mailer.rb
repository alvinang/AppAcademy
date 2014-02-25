class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def password_email(user)
    @user = user
    session_token = @user.reset_session_token
    @url = "localhost:3000/users/#{@user.id}/edit/#{session_token}"
    mail(to: user.email, subject: "Your password reset link")
  end
end
