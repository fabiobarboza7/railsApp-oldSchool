ActionMailer::Base.smtp_settings = {
  address: "smtpout.secureserver.net",
  port: 465,
  domain: 'moodev.com.br',
  user_name: ENV['SERVER_ADDRESS'],
  password: ENV['SERVER_PASSWORD'],
  authentication: :login,
  ssl: true
  # enable_starttls_auto: true
}
