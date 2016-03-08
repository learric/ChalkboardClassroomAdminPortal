# Preview all emails at http://localhost:3000/rails/mailers/reward_mailer
class RewardMailerPreview < ActionMailer::Preview

  def reward_email_preview
    user = {
        first_name: 'Rickey',
        email: 'email@user.com',
        winning_team: 'Auburn Tigers',
        losing_team: 'Alabama Crimson Tide',
        winning_score: 14,
        losing_score: 0
    }
    RewardMailer.reward_email(user)
  end

end
