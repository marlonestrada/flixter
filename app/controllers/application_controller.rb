class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :store_current_location
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    session[:current_location] || root_path
  end

  private

  def store_current_location
    unless self.is_a? DeviseController
      session[:current_location] = request.url
    end
  end
end
