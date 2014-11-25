class SubMailer < ActionMailer::Base
  default from: "admin@betastore.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sub_mailer.welcome.subject
  #
  def welcome(subscription)
    @name = subscription.email.split('@').first

    mail to: subscription.email
  end
end
