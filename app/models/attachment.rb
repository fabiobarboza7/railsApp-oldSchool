class Attachment < ApplicationRecord
  belongs_to :subject
  belongs_to :user

  # validates :title, presence: :true
  # validates :file, presence: :true


  mount_uploader :file, PhotoUploader
end
