class PagesController < ApplicationController
  def home
    # Get all courses
    @courses = Course.all
    @course = Course.new
  end
end
