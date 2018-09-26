class TestClassMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.test_class_mailer.schedule.subject
  #
  def schedule(user)
    @user = user  # Instance variable => available in view
    mail(to: @user.email, subject: "#{@user.parent}, aula agendada com sucesso!")
    # This will render a view in `app/views/test_class_mailer!
  end
end
