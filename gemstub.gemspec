# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gemstub}
  s.version = "2.0.0.pre2.20100812153325"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Bates"]
  s.date = %q{2010-08-12}
  s.default_executable = %q{gemstub}
  s.description = %q{Gemstub is a very simple tool for creating the stub code you need to build a gem.  Usage: at a command prompt simply type: gemstub your_gem_name_here  That's it, after that, you all you have to do is the actual coding of your gem! Enjoy!}
  s.email = %q{mark@markbates.com}
  s.executables = ["gemstub"]
  s.files = ["lib/gemstub/gem_generator/gem_generator.rb", "lib/gemstub/gem_generator/manifest.yml", "lib/gemstub/gem_generator/templates/app_gem.rb.template", "lib/gemstub/gem_generator/templates/app_init.rb.template", "lib/gemstub/gem_generator/templates/Gemfile.template", "lib/gemstub/gem_generator/templates/LICENSE.template", "lib/gemstub/gem_generator/templates/Rakefile.template", "lib/gemstub/gem_generator/templates/README.template", "lib/gemstub/gem_generator/templates/rvmrc.template", "lib/gemstub/gem_generator/templates/spec/app_spec.rb.template", "lib/gemstub/gem_generator/templates/spec/spec_helper.rb.template", "lib/gemstub/gem_generator/templates/test/test_app.rb.template", "lib/gemstub/gem_generator/templates/test/test_helper.rb.template", "lib/gemstub.rb", "README", "bin/gemstub"]
  s.homepage = %q{http://www.mackframework.com}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{gemstub}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Gemstub is a very simple tool for creating the stub code you need to build a gem.  Usage: at a command prompt simply type: gemstub your_gem_name_here  That's it, after that, you all you have to do is the actual coding of your gem! Enjoy!}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec>, [">= 2.0.0.beta.19"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<mark_facets>, [">= 0"])
      s.add_runtime_dependency(%q<genosaurus>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 2.0.0.beta.19"])
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<mark_facets>, [">= 0"])
      s.add_dependency(%q<genosaurus>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.0.0.beta.19"])
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<mark_facets>, [">= 0"])
    s.add_dependency(%q<genosaurus>, [">= 0"])
  end
end
