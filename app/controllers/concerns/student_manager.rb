module StudentManager
  extend ActiveSupport::Concern

  def current_student
    return if session[:userinfo].nil?

    @current_student ||= Student.find_or_create_by email: session[:userinfo]['info']['email']
  end
end
