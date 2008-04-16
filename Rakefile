require 'rake'
require 'rake/gempackagetask'
require 'rake/clean'
require 'find'

gem_spec = Gem::Specification.new do |s|
  s.name = 'gemstub'
  s.version = '1.0.4'
  s.summary = %{Gemstub is a very simple tool for creating the stub code you need to build a gem.

Usage: at a command prompt simply type: gemstub your_gem_name_here

That's it, after that, you all you have to do is the actual coding of your gem! Enjoy!
}
  
  s.test_files = FileList['test/**/*']
  
  s.files = FileList['lib/**/*.rb', 'README', 'doc/**/*.*']
  s.require_paths << 'lib'
  s.autorequire = ['gemstub']
  s.bindir = "bin"
  s.executables << "gemstub"
end

Rake::GemPackageTask.new(gem_spec) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
  rm_f FileList['pkg/**/*.*']
end