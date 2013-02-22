class <%= js_application_name %>.<%= plural_name.camelize %>Controller extends <%= js_application_name %>.ApplicationController
  routingKey: '<%= plural_name.underscore %>'

<% actions.each do |action| -%>
  <%= action %>: (params) ->

<% end -%>
