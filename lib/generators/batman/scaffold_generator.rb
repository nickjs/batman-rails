require 'generators/common'
module Batman
  module Generators
    class ScaffoldGenerator < ::Rails::Generators::NamedBase
      include Common
      requires_app_name

      desc "This generator creates the client side CRUD scaffolding"

      def create_batman_model
        with_app_name do
          generate "batman:model #{singular_model_name} #{app_name_flag}"
          generate "batman:view  #{singular_model_name} #{app_name_flag}"
          generate "batman:html  #{singular_model_name} #{app_name_flag}"
          generate "batman:controller #{singular_model_name} index show create update destroy #{app_name_flag}"
        end
      end

      protected
      def app_name_flag
        return if app_name == 'batman'
        "--app_name #{options[:app_name] || app_name}"
      end
    end
  end
end
