class Lesson < ApplicationRecord
  belongs_to :subject

  def next
    subject.lessons.where("id > ?", id).first
  end

  def prev
    subject.lessons.where("id < ?", id).last
  end


end
