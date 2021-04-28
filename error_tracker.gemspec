# frozen_string_literal: true

require_relative 'lib/error_tracker/version'

Gem::Specification.new do |spec|
  spec.name          = 'error_tracker'
  spec.version       = ErrorTracker::VERSION
  spec.authors       = ['Shkumbin Delija']
  spec.email         = ['shkumbin.delija@gmail.com']

  spec.summary       = 'Error Tracker!'
  spec.description   = 'Track handled and unhandled errors for your application.'
  spec.homepage      = 'https://github.com/ShkumbinDelija/error-tracker'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rails'
  spec.add_dependency 'sidekiq'
end
