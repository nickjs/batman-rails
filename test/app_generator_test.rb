require 'mocha'
require 'test_helper'
require 'generators/batman/app_generator'

module AppGeneratorTests

  def setup
    mkdir_p "#{destination_root}/app/assets"
    cp fixture(application_javascript_path), "#{destination_root}/app/assets"
    Rails.application.class.stubs(:name).returns("Dummy::Application")
    super
  end

  def teardown
    Rails.application.class.unstub(:name)
  end

  def test_batman_application_file_is_created
    run_generator

    assert_file "#{javascripts_path}batman/dummy.js.coffee" do |app|
      assert_match /class Dummy extends Batman\.App/, app
    end
  end

  def test_batman_application_file_is_created_for_two_word_application_name
    Rails.application.class.stubs(:name).returns("FooBar::Application")
    run_generator

    assert_file "#{javascripts_path}batman/foo_bar.js.coffee" do |app|
      assert_match /class FooBar extends Batman\.App/, app
    end
  end

  def test_batman_directory_structure_is_created
    run_generator

    %W{controllers models views html lib}.each do |dir|
      assert_directory "#{javascripts_path}/batman/#{dir}"
      assert_file "#{javascripts_path}batman/#{dir}/.gitkeep"
    end
  end

  def test_no_gitkeep_files_are_created_when_skipping_git
    run_generator [destination_root, "--skip-git"]

    %W{controllers models views html lib}.each do |dir|
      assert_directory "#{javascripts_path}/batman/#{dir}"
      assert_no_file "#{javascripts_path}/batman/#{dir}/.gitkeep"
    end
  end

  def test_jquery_isnt_added_when_skipping_jquery
    run_generator [destination_root, "--skip-jquery"]

    assert_file "#{javascripts_path}batman/dummy.js.coffee" do |app|
      assert_no_match /require jquery/, app
    end
  end

  def test_es5_shim_isnt_added_when_skipping_es5_shim
    run_generator [destination_root, "--skip-es5"]

    assert_file "#{javascripts_path}batman/dummy.js.coffee" do |app|
      assert_no_match /require batman\/es5-shim/, app
    end
  end

  def test_batmanjs_require_batman_jquery_rails
    run_generator

    assert_file "#{javascripts_path}batman/dummy.js.coffee" do |app|
      %W{batman batman.jquery batman.rails}.each do |require|
        assert_equal 1, app.scan(%r{require batman\/#{require}$}).length
      end

      %W{models controllers views lib}.each do |require|
        assert_equal 1, app.scan(/require_tree \.\/#{require}/).length
      end

      assert_equal 1, app.scan(/Dummy\.run\(\)/).length

    end
  end

  private

  def fixture(file)
    File.expand_path("fixtures/#{file}", File.dirname(__FILE__))
  end
end

class AppGeneratorWithApplicationJavascriptTest < Rails::Generators::TestCase
  tests Batman::Generators::AppGenerator

  def application_javascript_path
    "application.js"
  end

  include AppGeneratorTests
end

# class AppGeneratorWithApplicationCoffeescriptTest < Rails::Generators::TestCase
#   tests Batman::Generators::AppGenerator

#   def application_javascript_path
#     "application.js.coffee"
#   end

#   include AppGeneratorTests
# end
