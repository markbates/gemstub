# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "gemstub"
  s.version = "2.0.5.20110922110454"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Bates"]
  s.date = "2011-09-22"
  s.description = "Gemstub is a very simple tool for creating the stub code you need to build a gem.  Usage: at a command prompt simply type: gemstub your_gem_name_here  That's it, after that, you all you have to do is the actual coding of your gem! Enjoy!"
  s.email = "mark@markbates.com"
  s.executables = ["gemstub"]
  s.files = ["lib/gemstub/gem_generator/gem_generator.rb", "lib/gemstub/gem_generator/manifest.yml", "lib/gemstub/gem_generator/templates/app_gem.rb.template", "lib/gemstub/gem_generator/templates/app_init.rb.template", "lib/gemstub/gem_generator/templates/Gemfile.template", "lib/gemstub/gem_generator/templates/gitignore.template", "lib/gemstub/gem_generator/templates/LICENSE.template", "lib/gemstub/gem_generator/templates/Rakefile.template", "lib/gemstub/gem_generator/templates/README.template", "lib/gemstub/gem_generator/templates/rvmrc.template", "lib/gemstub/gem_generator/templates/spec/app_spec.rb.template", "lib/gemstub/gem_generator/templates/spec/spec_helper.rb.template", "lib/gemstub/gem_generator/templates/test/test_app.rb.template", "lib/gemstub/gem_generator/templates/test/test_helper.rb.template", "lib/gemstub.rb", "README", "bin/gemstub"]
  s.homepage = "http://www.mackframework.com"
  s.require_paths = ["lib"]
  s.rubyforge_project = "gemstub"
  s.rubygems_version = "1.8.10"
  s.summary = "Gemstub is a very simple tool for creating the stub code you need to build a gem.  Usage: at a command prompt simply type: gemstub your_gem_name_here  That's it, after that, you all you have to do is the actual coding of your gem! Enjoy!"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<mark_facets>, [">= 0"])
      s.add_runtime_dependency(%q<genosaurus>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_dependency(%q<activesupport>, [">= 3.0.0"])
      s.add_dependency(%q<mark_facets>, [">= 0"])
      s.add_dependency(%q<genosaurus>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.0.0"])
    s.add_dependency(%q<activesupport>, [">= 3.0.0"])
    s.add_dependency(%q<mark_facets>, [">= 0"])
    s.add_dependency(%q<genosaurus>, [">= 0"])
  end
end
