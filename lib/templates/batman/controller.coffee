class <%= js_application_name %>.<%= file_name.camelize %>Controller extends <%= js_application_name %>.ApplicationController
  routingKey: '<%= file_name.underscore %>'

<% actions.each do |action| -%>
  <%= action %>: (params) ->

<% end -%>
