class WhitelistMailer < ActionMailer::Base
  default from: ENV['GMAIL']

  def deliver_confirmation(email, status)
    @email = email
    @status = status
    mail(to: @email, subject: "Lori Tiernan invited you to join the WeKrüt Private Beta Test").deliver
  end
end