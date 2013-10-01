# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-subscriptions'
  s.version           = '0.0.1'
  s.description       = 'Ruby on Rails Subscriptions extension for Refinery CMS'
  s.date              = '2013-10-01'
  s.summary           = 'Subscriptions extension for Refinery CMS'
  s.authors           = ['Refactorit']
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.10'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.10'
end
