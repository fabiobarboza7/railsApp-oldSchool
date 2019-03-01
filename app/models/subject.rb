class Subject < ApplicationRecord
  has_many :lessons
  belongs_to :course

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end

end
