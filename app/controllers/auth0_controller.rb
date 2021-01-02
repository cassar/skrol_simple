class Auth0Controller < ApplicationController
  def callback
    session[:userinfo] = request.env['omniauth.auth']
    redirect_to request.env['omniauth.origin']
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end

  def test_login
    session[:userinfo] = {'info': {'email': params[:email]}}
  end
end
