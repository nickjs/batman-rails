module Batman
  module DefineViewHelper
    def batman_define_views
      batman_html_files.map do |pathname|
        content_tag :div, data: { defineview: batman_pathname_to_defineview_name(pathname) } do
          render file: pathname
        end
      end.reduce(:<<)
    end

    private

    def batman_path_to_html
      "app/assets/batman/html/"
    end

    def batman_pathname_to_defineview_name(pathname)
      pathname.split(batman_path_to_html).last.gsub(/\.html\.[a-z]+$/, '')
    end

    def batman_html_files
      Dir.glob("#{batman_path_to_html}**/*").select do |pathname|
        File.file?(pathname)
      end
    end
  end
end
