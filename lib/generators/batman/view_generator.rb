require 'generators/common'
module Batman
  module Generators
    class ViewGenerator < ::Rails::Generators::NamedBase
      include Common
      requires_app_name

      desc "This generator creates a Batman.View"
      argument :actions, :type => :array, :default => [], :banner => "action action"

      def create_batman_view
        with_app_name do
          template "batman/view.coffee", "#{app_path}/views/#{file_name.downcase}_view.js.coffee"
        end
      end
    end
  end
end
