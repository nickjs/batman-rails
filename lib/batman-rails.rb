require "batman-rails/version"
require "batman-rails/helpers/define_view_helper"

module Batman
  module Rails
    class Engine < ::Rails::Engine
      initializer 'batman_rails.action_controller' do |app|
        ActiveSupport.on_load :action_controller do
          helper Batman::DefineViewHelper
        end
      end
    end
  end
end
