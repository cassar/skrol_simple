require 'test_helper'

class LogoutControllerTest < ActionDispatch::IntegrationTest
  test 'get logged_out' do
    get auth_logged_out_url
    assert_redirected_to root_path
  end
end
