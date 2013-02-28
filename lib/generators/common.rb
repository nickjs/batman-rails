module Batman
  module Generators
    module Common
      def self.included(base)
        base.send(:extend, ClassMethods)
        base.source_root File.expand_path("../../templates", __FILE__)
      end

      protected
      def with_app_name
        raise "Batman application name must be given" unless app_name
        yield
      end

      def js_app_name
        app_name.camelize
      end

      def app_name
        @app_name ||= options[:app_name] || 'batman'
      end

      def js_application_name
        application_name.camelize
      end

      def application_name
        rails_application_name = if defined?(::Rails) && ::Rails.application
          ::Rails.application.class.name.split('::').first.underscore
        end
        @application_name ||= options[:app_name] || rails_application_name
      end

      def js_path
        "app/assets"
      end

      def app_path
        "#{js_path}/#{app_name}"
      end

      def singular_model_name
        singular_table_name.camelize
      end

      def app_name_flag
        return if app_name == 'batman'
        "--app_name #{options[:app_name] || app_name}"
      end

      module ClassMethods
        def requires_app_name
          class_option :app_name, :type => :string, :optional => true,
                       :desc => "Name of the Batman app (defaults to the Rails app name"
        end
      end
    end
  end
end
