require 'generators/common'
module Batman
  module Generators
    class ControllerGenerator < ::Rails::Generators::NamedBase
      include Common
      requires_app_name

      desc "This generator creates a Batman controller"
      argument :actions, :type => :array, :default => [], :banner => "action action"

      def create_batman_controller
        with_app_name do
          template "batman/controller.coffee", "#{app_path}/controllers/#{file_name.downcase}_controller.js.coffee"
          generate "batman:html #{plural_name} #{action_names} #{app_name_flag}"
          generate "batman:view  #{plural_name} #{action_names} #{app_name_flag}"
        end
      end

      def action_names
        options[:actions].join(' ') if options[:actions]
      end
    end
  end
end
