class Lesson < ApplicationRecord
  belongs_to :subject
  has_many :quizzes
  has_many :tests

  mount_uploader :file, PhotoUploader

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end

  def next
    subject.lessons.where("id > ?", id).first
  end

  def prev
    subject.lessons.where("id < ?", id).last
  end


end
