class <%= js_application_name %>.<%= file_name.camelize %>View extends Batman.View

<% actions.each do |action| -%>
class <%= js_application_name %>.<%= file_name.camelize %><%= action.camelize %>View extends <%= js_application_name %>.<%= file_name.camelize %>View

<% end -%>

