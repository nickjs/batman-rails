class <%= js_application_name %>.MainController extends <%= js_application_name %>.ApplicationController
  routingKey: 'main'

  index: (params) ->
    @set 'firstName', 'Bruce'
    @set 'lastName', 'Wayne'

  @accessor 'fullName', ->
    "#{@get('firstName')} #{@get('lastName')}"
