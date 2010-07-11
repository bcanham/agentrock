require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class RenderDirectlyController < ActionController::Metal
  include ActionController::Rendering
  include ActionController::Layouts
 
  append_view_path Rails.root.join("app", "views", "direct")
  append_view_path Rails.root.join("app", "views")
 
  layout "application"
 
  def index
    render *env["generic_views.render_args"]
  end
end
 
module GenericActions
  module Render
    def self.call(env)
    def render(*args)
      app = RenderDirectly.action(:index)
      lambda do |env|
        env["generic_views.render_args"] = args
        app.call(env)
      end
    end
    end
  end
end