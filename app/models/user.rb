class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  attr_writer :login

  before_save :get_age, if: :age?
  before_save :set_score
  after_create :create_wallet
  has_one :wallet, dependent: :destroy
  has_many :transictions
  has_many :user_answers
  has_many :enrollments
  has_many :attachments
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login]

  validates :username, presence: :true, uniqueness: { case_sensitive: false }

  def user_data
    "#{self.first_name} => #{self.login}"
  end

  def user_arrange
    User.all.order(first_name: :asc)
    "#{self.first_name} => #{self.login}"
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end


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
