$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "workarea/usaepay/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "workarea-usaepay"
  spec.version     = Workarea::Usaepay::VERSION
  spec.authors     = ["Sushmitha_Gowda"]
  spec.email       = ["sushmitha_gowda@example.com"]
  spec.homepage    = "https://github.com/sushmitha02/usaepay"
  spec.summary     = "Summary of Workarea::Usaepay."
  spec.description = "Description of Workarea::Usaepay."
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.4", ">= 5.2.4.1"
  spec.add_dependency 'faraday'
end
