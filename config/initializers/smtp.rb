ActionMailer::Base.smtp_settings = {
  address: "smtpout.secureserver.net",
  port: 465,
  domain: 'moodev.com.br',
  user_name: "pelotas@moodev.com.br",
  password: "Channel3@",
  authentication: :login,
  ssl: true
  # enable_starttls_auto: true
}
