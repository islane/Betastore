# Preview all emails at http://localhost:3000/rails/mailers/sub_mailer
class SubMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sub_mailer/welcome
  def welcome
    SubMailer.welcome
  end

end
