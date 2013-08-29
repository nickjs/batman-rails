require 'generators/common'
module Batman
  module Generators
    class HtmlGenerator < ::Rails::Generators::NamedBase
      include Common
      requires_app_name

      desc "This generator creates a the HTML files needed for a Batman.Controller"
      argument :actions, :type => :array, :default => [], :banner => "action action"

      def create_directory
        with_app_name do
          empty_directory "#{app_path}/html/#{plural_name.downcase}"
        end
      end

      def create_files
        with_app_name do
          actions.each do |file|
            template "batman/html/#{file}.html", "#{app_path}/html/#{plural_name.downcase}/#{file}.html"
          end
        end
      end

    end
  end
end
