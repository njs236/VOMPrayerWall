require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  #test "should get index" do
  #  get requests_index_url
  #  assert_response :success
  #end
  
  test "should get index" do
   login_user
   get requests_path
    assert_response :success
    assert response:body.include?(requests(:user_request).title)
  end
  
  test "should get new" do
    login_user
    get new_request_path
    assert_response :success
    assert_template 'new'
    assert_not_nil assigns(:request)
  end
  
  test "new shows new form" do
    login_user
    get new_request_path
    assert_select 'form p', count: 2
  end
    
  test "adds a request" do
    login_user
    assert_difference "Request.count" do
      post requests_path, params: {
        request: {
          title: 'test request',
          description: 'test description'
      }
    }
  end
  assert_redirected_to requests_path
  assert_not_nil flash[:notice]
  end
  
  test "rejects when missing request attribute" do
    login_user
    assert_no_difference "Request.count" do
      post requests_path, params: {
        request: { name: 'request without description' }
          }
    end
  end
  
  #test "show request" do
  #  get requests_path(requests(:one))
  #  assert_response :success
    #assert response.body.include?(stories(:one).name)
 # end
  
  #test "show story vote elements" do
  #  login_user
  #  get story_path(stories(:one))
  #  assert_select 'h2 span#vote_score'
  #  assert_select 'ul#vote_history li', count: 2
  #  assert_select 'div#vote_form form'
  #end
  
  #use show for displaying full prayer request information. 
  #test "show story submitter" do
  #  get request_path(stories(:one))
  #  assert_select 'p.submitted_by span a', 'Nathan Sinclair'
  #end
  
  test "indicates not logged in" do
    get requests_path
    assert_redirected_to new_session_path
  end
  
  test "show navigation menu" do
    login_user
    get requests_path
    assert_select 'ul#navigation li', 3
  end
  
  test "redirects if not logged in" do
    get new_request_path
    assert_response :redirect
    assert_redirected_to new_session_path
  end
  
  test "stores user with requests" do
    login_user
    post requests_path, params: {
      request: {
        name: 'prayer requests',
        description: 'test request'
      }
    }
    assert_equal users(:nathan), Request.last.user
  end
  
  #test "gets bin" do
  #  get bin_stories_path
  #  assert_response :success
  #  assert response.body.include?(stories(:two).name)
  #end
  
  test "request index is default" do
    assert_recognizes({controller: "requests", action: "index"}, "/")
  end
  
  test "shows request on index" do
    login_user
    get requests_path
    #assert_select 'h2', 'VOMPrayerWall'
    assert_select 'div#content div.request', count:3
  end
  
  #test "show stories in bin" do
  #  get bin_stories_path
  #  assert_select 'h2', 'Showing 2 upcoming stories'
  #  assert_select 'div#content div.story', count:2
  #end
  
  #test "does not show vote button if not logged in" do
  #  get story_path(stories(:one))
  #  assert_select 'div#vote_link', false
  #end

end
