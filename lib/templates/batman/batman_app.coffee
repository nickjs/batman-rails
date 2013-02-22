Batman.extend Batman.config,
  usePushState: true
  viewPrefix: '/assets/batman/html'

class <%= js_application_name %> extends Batman.App

  # @resources 'products'
  # @resources 'discounts', except: ['edit']
  # @resources 'customers', only: ['new', 'show']

  # @resources 'blogs', ->
  #   @resources 'articles'

  # @resources 'pages', ->
  #   @collection 'count'
  #   @member 'duplicate'

  # @route 'apps', 'apps#index'
  # @route 'apps/private', 'apps#private', as: 'privateApps'

  @root 'main#index'

# Tell Batman to start the app
window.<%= js_application_name %> = <%= js_application_name %>
<%= js_application_name %>.run()
