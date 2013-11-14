module Batman
  module DefineViewHelper
    def batman_define_views
      content_tag :script do
        raw %Q[(function(){#{BatmanView.all(self).map(&:inline_preload_javascript).join}})();]
      end
    end

    class BatmanView
      PATH_TO_HTML = "app/assets/batman/html/"

      attr_accessor :pathname, :render_context

      def self.all(render_context)
        Dir.glob("#{PATH_TO_HTML}**/*").select do |pathname|
          File.file?(pathname)
        end.collect do |pathname|
          new(pathname, render_context)
        end
      end

      def initialize(pathname, render_context)
        @pathname = pathname
        @render_context = render_context
      end

      def inline_preload_javascript
        %Q{Batman.View.store.set(#{name.to_json}, #{content.to_json});}
      end

      private

      def name
        pathname.split(PATH_TO_HTML).last.gsub(/\.html\.[a-z]+$/, '').to_s
      end

      def content
        render_context.render(file: pathname)
      end
    end
  end
end
