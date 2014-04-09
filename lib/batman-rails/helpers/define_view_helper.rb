module Batman
  module DefineViewHelper
    def batman_define_views(options={})
      content_tag :script do
        template_js_string = BatmanView.all(self, options).map(&:inline_preload_javascript).join
        raw %Q[(function(){#{template_js_string}})();]
      end
    end

    class BatmanView
      PATH_TO_HTML = "app/assets/batman/html/"

      attr_accessor :pathname, :render_context, :path_to_html

      def self.all(render_context, options={})
        path_to_html = options[:path_to_html] || PATH_TO_HTML
        glob_path = File.join(path_to_html, "**/*")
        valid_files = Dir.glob(glob_path).select { |pathname| File.file?(pathname) }
        valid_files.collect do |pathname|
          new(pathname, render_context, path_to_html: path_to_html)
        end
      end

      def initialize(pathname, render_context, options={})
        @pathname = pathname
        @render_context = render_context
        @path_to_html = options[:path_to_html] || PATH_TO_HTML
      end

      def inline_preload_javascript
        %Q{Batman.View.store.set(#{name.to_json}, #{content.to_json});}
      end

      private

      def name
        pathname.split(path_to_html).last.gsub(/\.html\.[a-z]+$/, '').to_s
      end

      def content
        render_context.render(file: pathname)
      end
    end
  end
end
