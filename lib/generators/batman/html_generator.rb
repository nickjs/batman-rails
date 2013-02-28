require 'generators/common'
module Batman
  module Generators
    class HtmlGenerator < ::Rails::Generators::NamedBase
      include Common
      requires_app_name

      desc "This generator creates a the HTML files needed for a Batman.Controller"
      argument :actions, :type => :array, :default => [], :banner => "action action"


      RESERVED_JS_WORDS = %w{
        break case catch continue debugger default delete do else finally for
        function if in instanceof new return switch this throw try typeof var void while with
      }

      def validate_no_reserved_words
        actions.each do |action|
          if RESERVED_JS_WORDS.include? action
             raise Thor::Error, "The name '#{action}' is reserved by javascript " <<
                                "Please choose an alternative action name and run this generator again."
          end
        end
      end

      def create_directory
        with_app_name do
          empty_directory "#{app_path}/html/#{plural_name.downcase}"
        end
      end

      def create_files
        with_app_name do
          (options[:arguments] || %w(index show edit)).each do |file|
            template "batman/html/#{file}.html", "#{app_path}/html/#{plural_name.downcase}/#{file}.html"
          end
        end
      end

    end
  end
end
