class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :rio_de_janeiro, :franchise]

  def home
    # Get all courses
    @courses = Course.all
    @course = Course.new
    @star = "<i class='fas fa-star text-yellow'></i>".html_safe
    @contact = Contact.new
    if user_signed_in?
      redirect_to dashboards_path
    end
  end

  def rio_de_janeiro
  	@contact = Contact.new
  end

  def franchise
    @contact = Contact.new
  end

end
