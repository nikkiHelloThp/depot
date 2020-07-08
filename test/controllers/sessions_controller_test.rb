require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should prompt for login" do
    get login_url
    assert_response :success
  end

  test "should login" do
    duke = users(:one)
    post login_url, params: { name: duke.name, password: 'secret'}
    assert_redirected_to admin_url
    assert_equal duke.id, session[:user_id]
  end

  test "should fail login" do
    duke = users(:one)
    post login_url, params: { name: duke.name, password: 'invalid' }
    assert_redirected_to login_url
  end

  test "should logout" do
    delete logout_url
    assert_redirected_to store_index_url
    assert_nil session[:user_id]
  end

end
