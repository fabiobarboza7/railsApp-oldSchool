class Contact < ApplicationRecord
  after_create :send_welcome_email

  def send_welcome_email
    ContactMailer.contact(self).deliver_now
    ContactMailer.contact_answer(self).deliver_now
  end
end
