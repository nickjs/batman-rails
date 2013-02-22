class <%= js_app_name %>Controller < ApplicationController

  def index
    render nothing: true, layout: '<%= app_name %>'
  end

end
