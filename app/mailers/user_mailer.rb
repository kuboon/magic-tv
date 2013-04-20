class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.programs.subject
  #
  def programs(user)
    @programs = Program.where(status: :ok).where("? < start_at and start_at < ?", Time.now, 2.weeks.since).order("start_at ASC").group_by{|p| p.start_at.to_date}
    mail to: user.email
  end
end
