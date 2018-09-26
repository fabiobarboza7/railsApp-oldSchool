class PagesController < ApplicationController
  def home
    # Get all courses
    @courses = Course.all
    @course = Course.new
    @star = "<i class='fas fa-star text-yellow'></i>".html_safe
    @contact = Contact.new
  end
end
