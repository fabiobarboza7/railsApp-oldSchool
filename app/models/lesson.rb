class Lesson < ApplicationRecord
  belongs_to :subject
  has_many :quizzes
  has_many :tests
  # before_save :file_nil?
  mount_uploader :file, PhotoUploader

  def next
    subject.lessons.where("id > ?", id).first
  end

  def prev
    subject.lessons.where("id < ?", id).last
  end

  # def file_nil?
  #   if self.file === "" || self.file === " "
  #     self.file = nil
  #   end
  # end


end
