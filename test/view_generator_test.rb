require 'test_helper'
require 'generators/batman/view_generator'

class ViewGeneratorTest < Rails::Generators::TestCase
  tests Batman::Generators::ViewGenerator

  test "simple view" do
    run_generator %w(task)

    assert_file "#{javascripts_path}/batman/views/task_view.js.coffee" do |view|
      view_class = Regexp.escape("class Sample.TaskView extends Batman.View")
      assert_match /#{view_class}/, view
    end
  end

  test "controller views" do
    run_generator %w(tasks index show)

    assert_file "#{javascripts_path}/batman/views/tasks/tasks_index_view.js.coffee" do |view|
      view_index_class = Regexp.escape("class Sample.TasksIndexView extends Batman.View")
      assert_match /#{view_index_class}/, view
    end

    assert_file "#{javascripts_path}/batman/views/tasks/tasks_show_view.js.coffee" do |view|
      view_show_class  = Regexp.escape("class Sample.TasksShowView extends Batman.View")
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
