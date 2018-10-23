class Lesson < ApplicationRecord
  belongs_to :subject
  has_many :quizzes
  has_many :tests

  mount_uploader :file, PhotoUploader

  def next
    subject.lessons.where("id > ?", id).first
  end

  def prev
    subject.lessons.where("id < ?", id).last
  end


end
