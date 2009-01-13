require 'rubygems'
require 'rake'
require 'rake/gempackagetask'

@gem_spec = Gem::Specification.new do |s|
  s.name = 'gemstub'
  s.version = '1.0.17'
  s.author = "Mark Bates"
  s.email = "mark@markbates.com"
  s.homepage = "http://www.mackframework.com"
  s.rubyforge_project = 'magrathea'
  s.summary = %{Gemstub is a very simple tool for creating the stub code you need to build a gem.

Usage: at a command prompt simply type: gemstub your_gem_name_here

That's it, after that, you all you have to do is the actual coding of your gem! Enjoy!
}
  
  s.test_files = FileList['test/**/*']
  
  s.files = FileList['lib/**/*.*', 'README', 'doc/**/*.*', 'bin/**/*.*']
  s.require_paths << 'lib'
  s.bindir = "bin"
  s.executables << "gemstub"
  s.add_dependency("mack-facets")
  s.add_dependency('genosaurus')
end