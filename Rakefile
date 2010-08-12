require 'rubygems'

# Set up gems listed in the Gemfile.
gemfile = File.expand_path('../Gemfile', __FILE__)
begin
  ENV['BUNDLE_GEMFILE'] = gemfile
  require 'bundler'
  Bundler.setup
rescue Bundler::GemNotFound => e
  STDERR.puts e.message
  STDERR.puts "Try running `bundle install`."
  exit!
end if File.exist?(gemfile)

Bundler.require


# require 'rake'
require 'rake/gempackagetask'
# require 'rake/clean'
# require 'rake/testtask'
# require 'rake/rdoctask'
# require 'find'
# # require 'rubyforge'
# # require 'rubygems'
# # require 'rubygems/gem_runner'
# require 'rspec/core'
# require 'rspec/core/rake_task'

@gem_spec = Gem::Specification.new do |s|
  s.name = 'gemstub'
  s.version = '2.0.0.pre1'
  s.author = "Mark Bates"
  s.email = "mark@markbates.com"
  s.homepage = "http://www.mackframework.com"
  s.rubyforge_project = 'gemstub'
  s.summary = %{Gemstub is a very simple tool for creating the stub code you need to build a gem.

Usage: at a command prompt simply type: gemstub your_gem_name_here

That's it, after that, you all you have to do is the actual coding of your gem! Enjoy!
}
  s.description = s.summary
  s.files = FileList['lib/**/*.*', 'README', 'doc/**/*.*', 'bin/**/*.*']
  s.require_paths = ['lib']
  s.bindir = "bin"
  s.executables << "gemstub"
  s.add_dependency("rspec", ">= 2.0.0.beta.19")
  s.add_dependency("activesupport")
  s.add_dependency("mark_facets")
  s.add_dependency('genosaurus')
  # s.add_dependency('rubyforge')
end

Rake::GemPackageTask.new(@gem_spec) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
  rm_f FileList['pkg/**/*.*']
end

# rake
# desc 'Run specifications'
# RSpec::Core::RakeTask.new(:default) do |t|
#   t.pattern = "./spec/gemstub/**/*_spec.rb"
# end

desc "Install the gem"
task :install => [:package] do |t|
  sudo = ENV['SUDOLESS'] == 'true' || RUBY_PLATFORM =~ /win32|cygwin/ ? '' : 'sudo'
  puts `#{sudo} gem install #{File.join("pkg", @gem_spec.name)}-#{@gem_spec.version}.gem --no-update-sources`
end

desc 'regenerate the gemspec'
task :gemspec do
  @gem_spec.version = "#{@gem_spec.version}.#{Time.now.strftime('%Y%m%d%H%M%S')}"
  File.open(File.join(File.dirname(__FILE__), 'gemstub.gemspec'), 'w') {|f| f.puts @gem_spec.to_ruby}
end

desc "Release the gem"
task :release => :install do |t|
  gem_pkg = File.join("pkg", "#{@gem_spec.name}-#{@gem_spec.version}.gem")
  system "gem push #{gem_pkg}"
end