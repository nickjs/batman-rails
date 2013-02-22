Batman.extend Batman.config,
  usePushState: true
  viewPrefix: '/assets/batman/html'

class <%= js_application_name %> extends Batman.App

  # @route '/controller/:id', 'controller#show', resource: 'model', action: 'show'
  # MOAR EXAMPLES
  @root 'main#index'

# Tell Batman to start the app
window.<%= js_application_name %> = <%= js_application_name %>
<%= js_application_name %>.run()
