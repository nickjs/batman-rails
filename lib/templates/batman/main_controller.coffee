class <%= js_application_name %>.MainController extends <%= js_application_name %>.ApplicationController
  routingKey: 'main'

  index: (params) ->
    @set 'firstName', 'James'
    @set 'lastName', 'Bond'

  @accessor 'fullName', ->
    "#{@get('firstName')} #{@get('lastName')}"
