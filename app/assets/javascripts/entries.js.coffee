# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#add_entry_link').click ->
		$('#entry-form').slideToggle()
		$('#add_entry_link').html('Show Form')