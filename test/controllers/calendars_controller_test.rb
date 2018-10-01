require 'test_helper'

class CalendarsControllerTest < ActionDispatch::IntegrationTest
  #test "should get index" do
   # get calendar_index_url
   # assert_response :success
  #end
  
  test "should get show" do
    login_user
    get calendars_show_path
    assert_response :success
    assert_select 'div', count: 3
  end
  
  
  
  

end
