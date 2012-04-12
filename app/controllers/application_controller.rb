class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :set_locale

  private
  def set_locale
    locale = params[:locale] || current_user.try(:language) || "#{I18n.default_locale}"
    logger.debug "[#{self.class}.set_locale] Change locale to #{locale}."
    I18n.locale = locale
  end
end
