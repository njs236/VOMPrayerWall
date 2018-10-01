require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  
  #test "should get new" do
  #  get sessions_new_url
  #  assert_response :success
  #end

  #test "should get create" do
 #   get sessions_create_url
  #  assert_response :success
    #end

  #test "should get destroy" do
  #  get sessions_destroy_url
  #  assert_response :success
  #end
  
  test "new shows a login form" do
    get new_session_path
    assert_response :success
    assert_select 'form p', 4
  end

  test "perform a user login" do
    post session_path, params: {email: 'nathan.sinclair@techmatics.co.nz', password: 'password'}
    assert_redirected_to requests_path
    assert_equal users(:nathan).id, session[:user_id]
  end
  test "bad login fails" do
    post session_path, params: {email: 'noone@nowhere.com', password:'user'}
    assert_response :success
    assert_nil session[:user_id]
  end
  test "redirects after login with return url" do
    get new_request_path
    assert_redirected_to new_session_path
    post session_path, 
    params: {
      email: 'nathan.sinclair@techmatics.co.nz', 
      password: 'password'
    }
    #assert_redirected_to new_story_path #because the path is taken away once redirected, then it will not have a location attached.
    #the first one works because you never actually go to new_story_path originally. 
    assert_redirected_to new_request_path
  end
  
  test "logout and clear session" do
    post session_path, params: {email: 'nathan.sinclair@techmatics.co.nz', password: 'password'}
    assert_not_nil session[:user_id]
    
    delete session_path
    assert_response :success
    assert_select 'h2', 'Logout successful'
    
    assert_nil session[:user_id]
  end

end
