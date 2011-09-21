# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gemstub}
  s.version = "2.0.4.20110920115314"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Mark Bates}]
  s.date = %q{2011-09-20}
  s.description = %q{Gemstub is a very simple tool for creating the stub code you need to build a gem.  Usage: at a command prompt simply type: gemstub your_gem_name_here  That's it, after that, you all you have to do is the actual coding of your gem! Enjoy!}
  s.email = %q{mark@markbates.com}
  s.executables = [%q{gemstub}]
  s.files = [%q{lib/gemstub/gem_generator/gem_generator.rb}, %q{lib/gemstub/gem_generator/manifest.yml}, %q{lib/gemstub/gem_generator/templates/app_gem.rb.template}, %q{lib/gemstub/gem_generator/templates/app_init.rb.template}, %q{lib/gemstub/gem_generator/templates/Gemfile.template}, %q{lib/gemstub/gem_generator/templates/gitignore.template}, %q{lib/gemstub/gem_generator/templates/LICENSE.template}, %q{lib/gemstub/gem_generator/templates/Rakefile.template}, %q{lib/gemstub/gem_generator/templates/README.template}, %q{lib/gemstub/gem_generator/templates/rvmrc.template}, %q{lib/gemstub/gem_generator/templates/spec/app_spec.rb.template}, %q{lib/gemstub/gem_generator/templates/spec/spec_helper.rb.template}, %q{lib/gemstub/gem_generator/templates/test/test_app.rb.template}, %q{lib/gemstub/gem_generator/templates/test/test_helper.rb.template}, %q{lib/gemstub.rb}, %q{README}, %q{bin/gemstub}]
  s.homepage = %q{http://www.mackframework.com}
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{gemstub}
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Gemstub is a very simple tool for creating the stub code you need to build a gem.  Usage: at a command prompt simply type: gemstub your_gem_name_here  That's it, after that, you all you have to do is the actual coding of your gem! Enjoy!}

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
