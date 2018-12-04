class Course < ApplicationRecord
  has_many  :subjects, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end

end
