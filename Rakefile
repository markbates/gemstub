require 'rake'
require 'rake/gempackagetask'
require 'rake/clean'
require 'rake/testtask'
require 'rake/rdoctask'
require 'find'
require 'rubyforge'
require 'rubygems'
require 'rubygems/gem_runner'
require 'spec'
require 'spec/rake/spectask'

@gem_spec = Gem::Specification.new do |s|
  s.name = 'gemstub'
  s.version = '1.1.2'
  s.author = "Mark Bates"
  s.email = "mark@markbates.com"
  s.homepage = "http://www.mackframework.com"
  s.rubyforge_project = 'gemstub'
  s.summary = %{Gemstub is a very simple tool for creating the stub code you need to build a gem.

Usage: at a command prompt simply type: gemstub your_gem_name_here

That's it, after that, you all you have to do is the actual coding of your gem! Enjoy!
}
  
  s.files = FileList['lib/**/*.*', 'README', 'doc/**/*.*', 'bin/**/*.*']
  s.require_paths = ['lib']
  s.bindir = "bin"
  s.executables << "gemstub"
  s.add_dependency("mack-facets")
  s.add_dependency('genosaurus')
  s.add_dependency('rubyforge')
end

Rake::GemPackageTask.new(@gem_spec) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
  rm_f FileList['pkg/**/*.*']
end

# rake
desc 'Run specifications'
Spec::Rake::SpecTask.new(:default) do |t|
  opts = File.join(File.dirname(__FILE__), "test", 'spec.opts')
  t.spec_opts << '--options' << opts if File.exists?(opts)
  t.spec_files = Dir.glob('spec/**/*_spec.rb')
end

desc "Install the gem"
task :install => [:gemspec, :package] do |t|
  sudo = ENV['SUDOLESS'] == 'true' || RUBY_PLATFORM =~ /win32|cygwin/ ? '' : 'sudo'
  puts `#{sudo} gem install #{File.join("pkg", @gem_spec.name)}-#{@gem_spec.version}.gem --no-update-sources`
end

desc 'regenerate the gemspec'
task :gemspec do
  File.open(File.join(File.dirname(__FILE__), 'gemstub.gemspec'), 'w') {|f| f.puts @gem_spec.to_ruby}
end

desc "Release the gem"
task :release => :install do |t|
  begin
    ac_path = File.join(ENV["HOME"], ".rubyforge", "auto-config.yml")
    if File.exists?(ac_path)
      fixed = File.open(ac_path).read.gsub("  ~: {}\n\n", '')
      fixed.gsub!(/    !ruby\/object:Gem::Version \? \n.+\n.+\n\n/, '')
      puts "Fixing #{ac_path}..."
      File.open(ac_path, "w") {|f| f.puts fixed}
    end
    begin
      rf = RubyForge.new
      rf.configure
      rf.login
      rf.add_release(@gem_spec.rubyforge_project, @gem_spec.name, @gem_spec.version, File.join("pkg", "#{@gem_spec.name}-#{@gem_spec.version}.gem"))
    rescue Exception => e
      if e.message.match("Invalid package_id") || e.message.match("no <package_id> configured for")
        puts "You need to create the package!"
        rf.create_package(@gem_spec.rubyforge_project, @gem_spec.name)
        rf.add_release(@gem_spec.rubyforge_project, @gem_spec.name, @gem_spec.version, File.join("pkg", "#{@gem_spec.name}-#{@gem_spec.version}.gem"))
      else
        raise e
      end
    end
  rescue Exception => e
    if e.message == "You have already released this version."
      puts e
    else
      raise e
    end
  end
end