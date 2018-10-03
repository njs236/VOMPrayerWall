# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#This will deal with request objects in addition to the screen itself

requests_pattern = /// _
(.*)
_ ///



@add_answer= (request_id) ->
  mydata = {
    id : request_id
  }
  #Rails.ajax({
  #  type: "POST", 
  #  url: "/requests/createanswer",
  #  data: mydata,
  #  success: function(repsonse){...},
  #  error: function(repsonse){...}
  #})
  console.log mydata.id