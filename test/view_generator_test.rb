require 'test_helper'
require 'generators/batman/view_generator'

class ViewGeneratorTest < Rails::Generators::TestCase
  tests Batman::Generators::ViewGenerator

  test "simple view" do
    run_generator %w(Task index show)

    assert_file "#{javascripts_path}/batman/views/task_view.js.coffee" do |view|
      view_class       = Regexp.escape("class Sample.TaskView extends Batman.View")
      view_index_class = Regexp.escape("class Sample.TaskIndexView extends Sample.TaskView")
      view_show_class  = Regexp.escape("class Sample.TaskShowView extends Sample.TaskView")

      assert_match /#{view_class}/, view
      assert_match /#{view_index_class}/, view
      assert_match /#{view_show_class}/, view
    end
  end

  test "view pluralization [singular]" do
    run_generator %w(Task)
    assert_file "#{javascripts_path}/batman/views/task_view.js.coffee" do |view|
      view_class = Regexp.escape("class Sample.TaskView extends Batman.View")
      assert_match /#{view_class}/, view
    end
  end

  test "view pluralization [plural]" do
    run_generator %w(Tasks)
    assert_file "#{javascripts_path}/batman/views/tasks_view.js.coffee" do |view|
      view_class = Regexp.escape("class Sample.TasksView extends Batman.View")
      assert_match /#{view_class}/, view
    end
  end
end
