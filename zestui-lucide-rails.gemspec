# frozen_string_literal: true

require_relative "lib/zestui-lucide-rails/version"

Gem::Specification.new do |spec|
  spec.name = "zestui-lucide-rails"
  spec.version = ZestuiLucideRails::VERSION
  spec.authors = ["Victor Gama", "Manu Janardhanan"]
  spec.email = ["hello@zestui.com"]

  spec.summary = "Ruby on Rails views helper method for rendering Lucide icons for use with ZestUI"
  spec.homepage = "https://github.com/zest-ui/zestui-lucide-rails"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir["LICENSE.txt", "README.md", "lib/**/*", "icons/stripped/*", "icons/stripped.bin.gz"]
  spec.require_paths = ["lib"]

  spec.add_dependency("railties", ">= 4.1.0")
  spec.metadata["rubygems_mfa_required"] = "true"
end
