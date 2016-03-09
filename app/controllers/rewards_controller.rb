class RewardsController < ApplicationController
  require 'mail'

  before_action :set_reward_params, only: [:send_email]
  before_action :set_mail_defaults, only: [:send_email]

  def send_email
    @user = set_reward_params

    subject = "#{ @user[:first_name] }, here is your reward"

    email = @user[:email]

    body = "<h1>Hi #{ @user[:first_name] }!</h1>

<p>Congratulations! Your <strong>#{ @user[:winning_team] }</strong> defeated the <strong>#{ @user[:losing_team] }</strong> in today's game, with a final score of <strong>#{ @user[:winning_score].to_s }</strong> - <strong>#{ @user[:losing_score].to_s }</strong></p>

<p>To reward you on your win, we have a special prize for you! Click the link below to redeem your trophy. If the link does not work, copy and paste it into your browser window.</p>

<p><a href='https://google.com'>https://google.com</a></p>"

    text_body = "Hi #{ @user[:first_name] }!

Congratulations! Your #{ @user[:winning_team] } defeated the #{ @user[:losing_team] } in today's game, with a final score of #{ @user[:winning_score].to_s } - #{ @user[:losing_score].to_s }

        To reward you on your win, we have a special prize for you! Copy and paste the link below into your browser window to redeem your trophy.

        https://google.com"

    Mail.deliver do
      from('rick@learricmedia.com')
      to(email)
      subject(subject)

      html_part do
        body(body)
      end

      text_part do
        body(text_body)
      end
    end
  end

  private

    def set_reward_params
      params.require(:reward).permit(:first_name, :email, :winning_team, :losing_team, :winning_score, :losing_score)
    end

    def set_mail_defaults
      unless Rails.env.production?
        ENV['EMAIL_USERNAME'] = 'learric@gmail.com'
        ENV['EMAIL_PASSWORD'] = 'NlwNwiK7FCjLCU2Tzzi3Rg'
      end

      Mail.defaults do
        delivery_method :smtp, {
            :port      => 587,
            :address   => 'smtp.mandrillapp.com',
            :user_name => ENV['EMAIL_USERNAME'],
            :password  => ENV['EMAIL_PASSWORD']
        }
      end
    end
end
