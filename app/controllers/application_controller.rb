class ApplicationController < ActionController::Base
  add_flash_types :success
  protect_from_forgery with: :exception

  helper_method :resource_name, :resource, :devise_mapping, :resource_class
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :age, :date_of_birth, :photo, :photo_cache, :admin])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :date_of_birth, :age, :photo, :photo_cache, :admin])
  end



  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "Você não está autorizado a realizar esta ação"
    redirect_to(root_path)
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end


  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def after_sign_in_path_for(resource)
    dashboards_path
  end

  private

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to root_path
      flash[:alert] = "Login ou senha inválidos, tente novamente..."
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end


end
