#-------------------------------------------------------------------------
#   Base Controller
#-------------------------------------------------------------------------

class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def set_admin_locale
    I18n.locale = params[:locale] || :en
  end
end
