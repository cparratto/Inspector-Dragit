module InspectorDragit
  class Engine < ::Rails::Engine
    isolate_namespace InspectorDragit

    config.generators do |g|
      g.test_framework :rspec
      g.integration_tool :rspec
    end

    initializer "inspector_dragit.view_helpers" do |app|
      ::ActionView::Base.send :include, ::InspectorDragit::ViewHelpers
    end

    initializer "inspector_dragit.active_record" do |app|
      ::ActiveRecord::Base.send :include, ::InspectorDragit::ActiveRecord::Include
    end
  end
end