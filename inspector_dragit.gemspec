$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "inspector_dragit/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "inspector_dragit"
  s.version     = InspectorDragit::VERSION
  s.authors     = ["Christopher William Parratto Jr"]
  s.email       = ["cparratto@gmail.com"]
  s.homepage    = "https://github.com/cparratto/Inspector-Dragit"
  s.summary     = "Drag an drop attribute inspector."
  s.description = "Drag and drop attribute inspector. Nests model attributes as html 5 data attributes on any html element.\
 The element becomes a draggable element. Drag elements to an inspector div to view its properties."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency 'haml'
  s.add_dependency 'haml-rails'
  s.add_dependency "jquery-rails"
  s.add_dependency 'jquery-ui-themes'

  s.add_development_dependency 'spork'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-spork'
end
