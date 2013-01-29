class <%= js_app_name %>.<%= plural_name.camelize %>Controller extends Batman.Controller
  routingKey: '<%= plural_name.underscore %>'
<% actions.each do |action| -%>
  <%= action %>: (params) ->
    
<% end -%>
