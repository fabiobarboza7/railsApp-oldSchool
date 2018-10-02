class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_save :get_age, if: :age?
  before_save :set_score
  after_create :create_wallet
  has_one :wallet, dependent: :destroy
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

  def create_wallet
    new_wallet = Wallet.new(user_id: self.id)
    new_wallet.save
  end

  def set_score
    if self.score == 0 or self.score.nil?
      self.score = 0
    end
  end

end
