# frozen_string_literal: true

require_relative 'lib/pg_connections_terminate/version'

::Gem::Specification.new do |spec|
  spec.name = 'pg_connections_terminate'
  spec.version = ::PgConnectionsTerminate::VERSION
  spec.authors = ['Michał Zaporski']
  spec.email = ['focus16k@gmail.com']

  spec.summary = 'Rails rake task for terminating postgresql connections.'
  spec.description = 'This gem adds a new rake task which terminates all the connections with the Rails app database.'
  spec.homepage = 'https://github.com/MichalZaporski/pg_connections_terminate'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = ::Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (::File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .gitlab-ci.yml appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| ::File.basename(f) }
  spec.require_paths = ['lib']
end
