# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#invoice_member_id').chosen()
  $('#invoice_client_id').chosen()
  $('#invoice_product_ids').chosen()
  $('.controls select').chosen()
