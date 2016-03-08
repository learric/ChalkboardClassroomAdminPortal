class RewardMailer < ApplicationMailer
  require 'mail'

  Mail.defaults do
    delivery_method :smtp, {
        :port      => 587,
        :address   => 'smtp.mandrillapp.com',
        :user_name => 'learric@gmail.com'
    }
  end

  def reward_email(user)
    @user = user

    Mail.deliver do
      from     'rewards@thechalkboardclassroom.com'
      to       'learric@gmail.com'
      subject  'Test Email'
    end

  end
end
