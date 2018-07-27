Spree::UserMailer.class_eval do
  def signup_confirmation(user)
    @user = user
    mail(:to => user.email, :from => from_address,
         :subject => t(:welcome_to) + Spree::Config[:site_name])
  end

  # Overriding `Spree::UserMailer.confirmation_instructions` which is
  # overriding `Devise::Mailer.confirmation_instructions`.
  def confirmation_instructions(user, _opts)
    @user = user
    @instance = Spree::Config[:site_name]
    @contact = ContentConfig.footer_email

    subject = t('spree.user_mailer.confirmation_instructions.subject')
    mail(to: user.email,
         from: from_address,
         subject: subject)
  end
end
