$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "omniauth-centralid/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "omniauth-centralid"
  s.version     = OmniauthCentralid::VERSION
  s.authors     = ["yafoy"]
  s.email       = ["contact@yafoy.com"]
  s.homepage    = "http://github.com/yafoy/omniauth-centralid"
  s.summary     = "Central ID stategy for OmniAuth"
  s.description = "This gem contains the Central ID strategy for OmniAuth"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  # Pin omniauth-oauth2 since v1.4.0 removed the callback_url method
  # https://github.com/intridea/omniauth-oauth2/issues/93#issuecomment-227247801
  s.add_runtime_dependency 'omniauth-oauth2', '= 1.3.1'
end
