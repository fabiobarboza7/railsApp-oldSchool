class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_save :get_age
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def user_age(age)
    now = Time.now.utc.to_date
    now.year - age.year - ((now.month > age.month || (
    now.month == age.month && now.day >= age.day)) ? 0 : 1)
  end

  def get_age
    self.age = user_age(self.date_of_birth)
  end


end
