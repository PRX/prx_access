lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "prx_access/version"

Gem::Specification.new do |spec|
  spec.name          = "prx_access"
  spec.version       = PRXAccess::VERSION
  spec.authors       = ["Sam Vevang"]
  spec.email         = ["sam.vevang@prx.org"]

  spec.summary       = %q{PRX Access navigates HAL hypermedia resources on PRX services.}
  spec.description   = %q{PRX Access is a gem to supply authentication headers and descend the HAL hypermedia link tree on PRX's APIs.}
  spec.homepage      = "https://github.com/PRX/prx_access"

  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/PRX/prx_access"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "hyperresource", "~> 0.9.4"
  spec.add_dependency "activesupport", ">= 4.0.0"

  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
