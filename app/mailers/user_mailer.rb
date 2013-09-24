class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def match_email(user)
    recipients  user.match_email
    from        "from@example.com"
    subject     "Shhhh. It's a secret, Santa."
    body        :user => user
  end
end
