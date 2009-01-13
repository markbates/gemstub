# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gemstub}
  s.version = "1.0.17"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Bates"]
  s.date = %q{2009-01-13}
  s.default_executable = %q{gemstub}
  s.email = %q{mark@markbates.com}
  s.executables = ["gemstub"]
  s.files = ["lib/gem_generator.rb", "lib/templates/%=app%/lib/%=app%/%=app%.rb.template", "lib/templates/%=app%/lib/%=app%.rb.template", "lib/templates/%=app%/Rakefile.template", "lib/templates/%=app%/README.template", "lib/templates/%=app%/test/lib/%=app%_spec.rb.template", "lib/templates/%=app%/test/spec.opts.template", "lib/templates/%=app%/test/spec_helper.rb.template", "README", "test/foo_test.rb", "test/test_helper.rb", "bin/gemstub"]
  s.homepage = %q{http://www.mackframework.com}
  s.require_paths = ["lib", "lib"]
  s.rubyforge_project = %q{gemstub}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Gemstub is a very simple tool for creating the stub code you need to build a gem.  Usage: at a command prompt simply type: gemstub your_gem_name_here  That's it, after that, you all you have to do is the actual coding of your gem! Enjoy!}
  s.test_files = ["test/foo_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mack-facets>, [">= 0"])
      s.add_runtime_dependency(%q<genosaurus>, [">= 0"])
    else
      s.add_dependency(%q<mack-facets>, [">= 0"])
      s.add_dependency(%q<genosaurus>, [">= 0"])
    end
  else
    s.add_dependency(%q<mack-facets>, [">= 0"])
    s.add_dependency(%q<genosaurus>, [">= 0"])
  end
end
