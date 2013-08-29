require 'generators/common'
module Batman
  module Generators
    class ViewGenerator < ::Rails::Generators::NamedBase
      include Common
      requires_app_name

      desc "This generator creates a Batman.View"
      argument :actions, :type => :array, :default => [], :banner => "action action"

      def create_directory
        return if actions.length == 0

        with_app_name do
          empty_directory "#{app_path}/views/#{plural_name.downcase}"
        end
      end

      def create_files
        with_app_name do
          if actions.length == 0
            @file = "#{file_name}_view".downcase
            template "batman/view.coffee", "#{app_path}/views/#{@file}.js.coffee"
          else
            actions.each do |file|
              @file = "#{plural_name}_#{file}_view".downcase
              template "batman/view.coffee", "#{app_path}/views/#{plural_name.downcase}/#{@file}.js.coffee"
            end
          end
        end
      end

    end
  end
end
