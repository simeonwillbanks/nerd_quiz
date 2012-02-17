# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nerd_quiz/version"

Gem::Specification.new do |s|
  s.name        = "nerd_quiz"
  s.version     = NerdQuiz::VERSION
  s.authors     = ["Simeon F. Willbanks"]
  s.email       = ["sfw@simeonfosterwillbanks.com"]
  s.homepage    = "http://www.simeonfosterwillbanks.com"
  s.summary     = %q{A ruby gem which implements a command line interface to NerdPursuit questions}
  s.description = %q{Test your nerd skills by answering NerdPursuit questions!}

  s.rubyforge_project = "nerd_quiz"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
