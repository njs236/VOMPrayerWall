# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#This will deal with request objects in addition to the screen itself

requests_pattern = /// _
(.*)
_ ///



@add_answer= (request_id) ->
  mydata = {
	  
    request_id : request_id
  }
  $.ajax '/requests/createanswer',
    type: "POST"
    data: mydata
   success: (response) ->
	   console.log "successful ajax call"
    error: (response)->
		console.log "error in ajax call"

  console.log mydata.id