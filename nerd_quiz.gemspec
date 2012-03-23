# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'nerd_quiz/version'

Gem::Specification.new do |s|
  s.name        = 'nerd_quiz'
  s.version     = NerdQuiz::VERSION
  s.authors     = ['Simeon F. Willbanks']
  s.email       = ['sfw@simeonfosterwillbanks.com']
  s.homepage    = 'https://github.com/simeonwillbanks/nerd_quiz'
  s.summary     = %q{A ruby gem which implements a command line interface to NerdPursuit questions}
  s.description = %q{Test your nerd skills by answering NerdPursuit questions!}

  s.rubyforge_project = 'nerd_quiz'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = %w(nquiz)
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.9.2'
  s.license = 'MIT'

  # specify any dependencies here; for example:
  s.add_dependency 'yajl-ruby'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'cucumber'
end
