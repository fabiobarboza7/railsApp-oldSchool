class TestClass < ApplicationRecord
  after_create :send_welcome_email
  belongs_to :course

  SCHEDULE_DAYS = ['Segunda-Feira 09:00 até 10:00', 'Segunda-Feira 14:00 até 15:00', 'Segunda-Feira 17:00 até 18:00', 'Quarta-Feira 09:00 até 10:00', 'Quinta-Feira 09:00 até 10:00', 'Quinta-Feira 14:00 até 15:00', 'Quinta-Feira 17:00 até 18:00', 'Sexta-Feira 17:00 até 18:00']
  validates :schedule, inclusion: { :in => SCHEDULE_DAYS }
  validates :student, :age, :parent, :email, :phone, presence: true



  private

  def send_welcome_email
    TestClassMailer.schedule(self).deliver_now
    TestClassMailer.schedule_answer(self).deliver_now
  end

end
