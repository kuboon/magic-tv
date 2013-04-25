# -*- coding: utf-8 -*-
class UserMailer < ActionMailer::Base
  default from: "noreply@magic-tv.trick-with.net"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.programs.subject
  #
  def activate(user)
    @activate_url = activate_user_url(user.key)
    mail to: user.email, subject: "[Magic TV] メールアドレスの確認"
  end
  def programs(user)
    @programs = Program.includes(:base_tags).where(status: :ok).where("? < start_at and start_at < ?", Time.now, 2.weeks.since).order("start_at ASC").group_by{|p| p.start_at.to_date}
    @unsubscribe_url = unsubscribe_user_url(user.key)
    mail to: user.email, subject: "[Magic TV] #{Date.today} から2週間のマジック番組"
  end
end
