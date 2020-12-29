class LogoutController < ApplicationController
  include LogoutHelper

  def logout
    reset_session
    redirect_to logout_url.to_s
  end

  def logged_out
    redirect_to root_path, notice: 'You have been logged out'
  end
end
