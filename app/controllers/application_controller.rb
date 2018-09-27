class ApplicationController < ActionController::Base
  add_flash_types :success
  protect_from_forgery with: :exception
end
