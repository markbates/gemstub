require 'rake'
require 'rake/gempackagetask'
require 'rake/clean'
require 'find'

GEM_VERSION = '1.0.5'

gem_spec = Gem::Specification.new do |s|
  s.name = 'gemstub'
  s.version = GEM_VERSION
  s.author = "Mark Bates"
  s.email = "mark@markbates.com"
  s.homepage = "http://www.mackframework.com"
  s.rubyforge_project = "magrathea"
  s.summary = %{Gemstub is a very simple tool for creating the stub code you need to build a gem.

Usage: at a command prompt simply type: gemstub your_gem_name_here

That's it, after that, you all you have to do is the actual coding of your gem! Enjoy!
}
  
  s.test_files = FileList['test/**/*']
  
  s.files = FileList['lib/**/*.rb', 'README', 'doc/**/*.*', 'bin/**/*.*']
  s.require_paths << 'lib'
  s.bindir = "bin"
  s.executables << "gemstub"
end

Rake::GemPackageTask.new(gem_spec) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
  rm_f FileList['pkg/**/*.*']
end

desc "Install the gem"
task :install => :package do |t|
  puts `sudo gem install pkg/gemstub-#{GEM_VERSION}.gem`
end