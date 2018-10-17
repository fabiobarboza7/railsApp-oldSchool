class Tutorial < ApplicationRecord
  belongs_to :course

  mount_uploader :file, PhotoUploader
end
