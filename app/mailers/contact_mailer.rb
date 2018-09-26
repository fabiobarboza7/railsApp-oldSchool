class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact.subject
  #
  def contact(user)
    @user = user  # Instance variable => available in view
    mail(to: @user.email, subject: "#{@user.name}, contato feito com sucesso!")
    # This will render a view in `app/views/test_class_mailer!
  end

  def contact_answer(user)
    @user = user  # Instance variable => available in view
    mail(to: "pelotas@moodev.com.br", subject: "Contato feito por #{user.name}")
    # This will render a view in `app/views/test_class_mailer!
  end

end
