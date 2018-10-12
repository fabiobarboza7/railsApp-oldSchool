class Blog < ApplicationRecord
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
