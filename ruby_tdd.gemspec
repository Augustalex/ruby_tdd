lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruby_tdd/version"

Gem::Specification.new do |spec|
  spec.name          = "ruby_tdd"
  spec.version       = RubyTdd::VERSION
  spec.authors       = ["August Alexandersson"]
  spec.email         = ["augustalexandersson@gmail.com"]

  spec.summary       = %q{Small testing framework. For small tests. For small things.}
  spec.description       = %q{Small testing framework. For small tests. For small things.}
  spec.license       = "MIT"

  spec.homepage = 'https://github.com/Augustalex/ruby_tdd'

  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
