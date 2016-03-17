class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :unauthorized

  private

  def unauthorized
    flash[:alert] = 'You are not authorized to perform this action'
    redirect_to(request.referrer || root_path)
  end
end
