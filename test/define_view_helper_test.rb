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
    File.expects(:join).with("app/assets/batman/templates/", "**/*").returns("app/assets/batman/templates/**/*")
    batman_define_views(path_to_html: "app/assets/batman/templates")
  end

end
