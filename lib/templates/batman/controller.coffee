class <%= js_application_name %>.<%= singular_name.camelize %>Controller extends <%= js_application_name %>.ApplicationController
  routingKey: '<%= singular_name.underscore %>'

<% actions.each do |action| -%>
  <%= action %>: (params) ->

<% end -%>
