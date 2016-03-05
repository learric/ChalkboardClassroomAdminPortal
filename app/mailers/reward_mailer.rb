class RewardMailer < ApplicationMailer
  default from: 'rewards@thechalkboardclassroom.com'

  def reward_email(user)
    @user = user
    mail(to: @user[:email], subject: "#{@user[:first_name]}, here is your reward!")
  end
end
