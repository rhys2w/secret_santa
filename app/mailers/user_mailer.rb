class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def match_email(user)
    @user = user
    mail(to: @user.email, subject: "Shhhhh. It's a secret, Santa.")
end
