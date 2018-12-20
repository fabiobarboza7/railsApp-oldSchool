class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :rio_de_janeiro]

  def home
    # Get all courses
    @courses = Course.all
    @course = Course.new
    @star = "<i class='fas fa-star text-yellow'></i>".html_safe
    @contact = Contact.new
  end

  def rio_de_janeiro
  	
  end
end
