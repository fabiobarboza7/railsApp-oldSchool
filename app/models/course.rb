class Course < ApplicationRecord
  has_many  :subjects, dependent: :destroy
  mount_uploader :photo, PhotoUploader

end
