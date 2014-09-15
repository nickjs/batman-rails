require 'test_helper'
require 'generators/batman/view_generator'

class DefineViewHelperTest < ActionView::TestCase
  include Batman::DefineViewHelper
  tests Batman::DefineViewHelper

  test "it defaults to looking in app/assets/batman/html" do
    File.expects(:join).with("app/assets/batman/html/", "**/*").returns("app/assets/batman/html/**/*")
    batman_define_views
  end

  test "it can be given override path" do
    File.expects(:join).with("app/assets/batman/templates", "**/*").returns("app/assets/batman/templates/**/*")
    batman_define_views(path_to_html: "app/assets/batman/templates")
  end

  test "it adds templates to store with base names" do
    render_context = Class.new do
      def render(options)
        "template contents"
      end
    end.new

    %w[
      app/assets/batman/html/products/index.html.haml.erb
      app/assets/batman/html/products/index.html.haml
      app/assets/batman/html/products/index.html
    ].each do |pathname|
      view = BatmanView.new(pathname, render_context)
      assert_equal('Batman.View.store.set("products/index", "template contents");', view.inline_preload_javascript)
    end

    %w[
      app/assets/batman/html/orders/custom.action.html.haml.erb
      app/assets/batman/html/orders/custom.action.html.haml
      app/assets/batman/html/orders/custom.action.html
    ].each do |pathname|
      view = BatmanView.new(pathname, render_context)
      assert_equal('Batman.View.store.set("orders/custom.action", "template contents");', view.inline_preload_javascript)
    end
  end
end
