class <%= js_application_name %>.<%= singular_model_name %> extends Batman.Model
  @resourceName: '<%= plural_name %>'
  @storageKey: '<%= plural_name %>'

  @persist Batman.RailsStorage

  # Use @encode to tell batman.js which properties Rails will send back with its JSON.
  # @encode 'name'
  @encodeTimestamps()

<% attributes.each do |attribute| -%>
  @encode <%= render_attribute(attribute) %>
<% end -%>
