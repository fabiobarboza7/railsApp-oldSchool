class Attachment < ApplicationRecord
  belongs_to :subject

  mount_uploader :file, PhotoUploader
end
