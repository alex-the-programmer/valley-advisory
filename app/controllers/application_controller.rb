class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def authenticate(*roles)
    authenticate_user!

    unless roles.include?(current_user.role)
      redirect_to root_path, alert: 'You''re not authenticated to this action!'
    end
  end
end
