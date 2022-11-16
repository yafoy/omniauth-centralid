lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth-centralid/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "omniauth-centralid"
  s.version     = OmniauthCentralid::VERSION
  s.authors     = ["yafoy"]
  s.email       = ["contact@yafoy.com"]
  s.homepage    = "http://github.com/yafoy/omniauth-centralid"
  s.summary     = "Central ID stategy for OmniAuth"
  s.description = "This gem contains Central ID strategy for OmniAuth"
  s.license     = "MIT"

  s.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  #s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  #s.test_files = Dir["test/**/*"]

  # Pin omniauth-oauth2 since v1.4.0 removed the callback_url method
  # https://github.com/intridea/omniauth-oauth2/issues/93#issuecomment-227247801
  # https://github.com/WebTheoryLLC/omniauth-twitch/issues/3
  s.add_runtime_dependency "omniauth-oauth2", "~> 1.5", ">= 1.5.0"

  s.add_development_dependency "bundler", "~> 2"
  s.add_development_dependency "rake"
  s.add_development_dependency "minitest", "~> 5.0"
  s.add_development_dependency "minitest-reporters", "~> 1.3"
end
