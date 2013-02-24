require 'test_helper'
require 'generators/batman/controller_generator'

class ControllerGeneratorTest < Rails::Generators::TestCase
  tests Batman::Generators::ControllerGenerator

  test "simple controller" do
    run_generator %w(Task index show)

    assert_file "#{javascripts_path}/batman/controllers/task_controller.js.coffee" do |controller|
      controller_class = Regexp.escape("class Sample.TaskController extends Sample.ApplicationController")

      assert_match /#{controller_class}/, controller
      assert_match %r{  index: \(params\) ->}, controller
      assert_match %r{  show: \(params\) ->}, controller
    end
  end

  test "controller pluralization [singular]" do
    run_generator %w(Task index show)
    assert_file "#{javascripts_path}/batman/controllers/task_controller.js.coffee" do |controller|
      controller_class = Regexp.escape("class Sample.TaskController extends Sample.ApplicationController")
      assert_match /#{controller_class}/, controller
    end
  end

  test "controller pluralization [plural]" do
    run_generator %w(Tasks index show)
    assert_file "#{javascripts_path}/batman/controllers/tasks_controller.js.coffee" do |controller|
      controller_class = Regexp.escape("class Sample.TasksController extends Sample.ApplicationController")
      assert_match /#{controller_class}/, controller
    end
  end

  test "two word controller is camelcased" do
    run_generator %w(RegularUser index)

    assert_file "#{javascripts_path}/batman/controllers/regular_user_controller.js.coffee" do |controller|
      controller_class = Regexp.escape("class Sample.RegularUserController extends Sample.ApplicationController")

      assert_match /#{controller_class}/, controller
      assert_match %r{  index: \(params\) ->}, controller
    end
  end

  test "simple controller with app_name" do
    run_generator %w(Task index --app_name MyApp)

    assert_file "#{javascripts_path}/MyApp/controllers/task_controller.js.coffee" do |controller|
      controller_class = Regexp.escape("class MyApp.TaskController extends MyApp.ApplicationController")

      assert_match /#{controller_class}/, controller
      assert_match %r{  index: \(params\) ->}, controller
    end
  end

  test "routingKey is present" do
    run_generator %w(Resource)

    assert_file "#{javascripts_path}/batman/controllers/resource_controller.js.coffee" do |controller|
      routing_key = Regexp.escape("routingKey: 'resource'")

      assert_match /#{routing_key}/ , controller
    end
  end
end
