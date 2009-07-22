# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gemstub}
  s.version = "1.5.0.20090722113517"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Bates"]
  s.date = %q{2009-07-22}
  s.default_executable = %q{gemstub}
  s.email = %q{mark@markbates.com}
  s.executables = ["gemstub"]
  s.files = ["lib/gemstub/gem_generator/gem_generator.rb", "lib/gemstub/gem_generator/manifest.yml", "lib/gemstub/gem_generator/templates/app_gem.rb.template", "lib/gemstub/gem_generator/templates/app_init.rb.template", "lib/gemstub/gem_generator/templates/LICENSE.template", "lib/gemstub/gem_generator/templates/Rakefile.template", "lib/gemstub/gem_generator/templates/README.template", "lib/gemstub/gem_generator/templates/spec/app_spec.rb.template", "lib/gemstub/gem_generator/templates/spec/spec.opts.template", "lib/gemstub/gem_generator/templates/spec/spec_helper.rb.template", "lib/gemstub/gem_generator/templates/test/test_app.rb.template", "lib/gemstub/gem_generator/templates/test/test_helper.rb.template", "lib/gemstub.rb", "README", "bin/gemstub"]
  s.homepage = %q{http://www.mackframework.com}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{gemstub}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Gemstub is a very simple tool for creating the stub code you need to build a gem.  Usage: at a command prompt simply type: gemstub your_gem_name_here  That's it, after that, you all you have to do is the actual coding of your gem! Enjoy!}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mack-facets>, [">= 0"])
      s.add_runtime_dependency(%q<genosaurus>, [">= 0"])
      s.add_runtime_dependency(%q<rubyforge>, [">= 0"])
    else
      s.add_dependency(%q<mack-facets>, [">= 0"])
      s.add_dependency(%q<genosaurus>, [">= 0"])
      s.add_dependency(%q<rubyforge>, [">= 0"])
    end
  else
    s.add_dependency(%q<mack-facets>, [">= 0"])
    s.add_dependency(%q<genosaurus>, [">= 0"])
    s.add_dependency(%q<rubyforge>, [">= 0"])
  end
end
