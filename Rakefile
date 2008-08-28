require 'rake'
require 'rake/gempackagetask'
require 'rake/clean'
require 'find'
require 'rubyforge'
require 'rubygems'
require 'rubygems/gem_runner'
require 'rake/testtask'
require 'rake/rdoctask'

GEM_VERSION = '1.0.14'
GEM_NAME = "gemstub"
GEM_RUBYFORGE_PROJECT = "magrathea"

gem_spec = Gem::Specification.new do |s|
  s.name = GEM_NAME
  s.version = GEM_VERSION
  s.author = "Mark Bates"
  s.email = "mark@markbates.com"
  s.homepage = "http://www.mackframework.com"
  s.rubyforge_project = GEM_RUBYFORGE_PROJECT
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
end

Rake::GemPackageTask.new(gem_spec) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
  rm_f FileList['pkg/**/*.*']
end

desc "Install the gemstub"
task :install => :package do |t|
  system "sudo gem install pkg/#{GEM_NAME}-#{GEM_VERSION}.gem --no-update-sources --local"
end

desc "Release gemstub"
task :release => :install do |t|
  begin
    rf = RubyForge.new
    rf.configure
    rf.login
    begin
      rf.add_release(GEM_RUBYFORGE_PROJECT, GEM_NAME, GEM_VERSION, File.join("pkg", "#{GEM_NAME}-#{GEM_VERSION}.gem"))
    rescue Exception => e
      if e.message.match("Invalid package_id") || e.message.match("no <package_id> configured for")
        puts "You need to create the package!"
        rf.create_package(GEM_RUBYFORGE_PROJECT, GEM_NAME)
        rf.add_release(GEM_RUBYFORGE_PROJECT, GEM_NAME, GEM_VERSION, File.join("pkg", "#{GEM_NAME}-#{GEM_VERSION}.gem"))
      else
        raise e
      end
    end
  rescue Exception => e
    puts e
  end
end