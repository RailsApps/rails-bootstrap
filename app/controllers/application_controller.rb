class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :show_flash

  private

  def show_flash
    flash[:success] = "Found the about page!" if request.path == '/pages/about'
  end
end
