require 'genosaurus'
require "mack-facets"
require File.join(File.dirname(__FILE__), 'gemstub', 'gem_generator', 'gem_generator')

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
require 'fileutils'

module Gemstub
  
  class << self
    
    attr_accessor :test_framework
    
    def rspec?
      test_framework == :rspec
    end
    
    def test_unit?
      test_framework == :test_unit
    end
    
    def test_framework=(framework)
      @test_framework = framework
      if rspec?
        # rake
        desc 'Run specifications'
        Spec::Rake::SpecTask.new(:default) do |t|
          opts = File.join('spec', 'spec.opts')
          t.spec_opts << '--options' << opts if File.exists?(opts)
          t.spec_files = Dir.glob('spec/**/*_spec.rb')
        end
      elsif test_unit?
        task :default => :test
        Rake::TestTask.new do |t| 
          t.libs << "test"
          t.pattern = 'test/unit/**/test_*.rb'
          t.verbose = true
          t.warning = true
        end
      end
    end
    
    def gem_spec(&block)
      @gem_spec = Gem::Specification.new do |s|
        s.name = File.basename(FileUtils.pwd)
        s.version = "0.0.1"
        s.summary = s.name
        s.author = (ENV["USERNAME"] || ENV["USER"])
        s.description = "#{s.name} was developed by: #{s.author}"
        s.email = ""
        s.homepage = ""
        s.files = FileList['lib/**/*.*', 'README', 'LICENSE', 'bin/**/*.*']
        s.require_paths = ['lib']
        s.extra_rdoc_files = ['README', 'LICENSE']
        s.has_rdoc = true
        yield s
      end

      # rake package
      Rake::GemPackageTask.new(@gem_spec) do |pkg|
        pkg.need_zip = false
        pkg.need_tar = false
        rm_f FileList['pkg/**/*.*']
      end

      desc 'regenerate the gemspec'
      task :gemspec => [:readme] do
        @gem_spec.version = "#{@gem_spec.version}.#{Time.now.strftime('%Y%m%d%H%M%S')}"
        File.open(File.join("#{@gem_spec.name}.gemspec"), 'w') {|f| f.puts @gem_spec.to_ruby}
      end

      desc "Install the gem"
      task :install => [:readme, :package] do |t|
        sudo = ENV['SUDOLESS'] == 'true' || RUBY_PLATFORM =~ /win32|cygwin/ ? '' : 'sudo'
        puts `#{sudo} gem install #{File.join("pkg", @gem_spec.name)}-#{@gem_spec.version}.gem --no-update-sources --no-ri --no-rdoc`
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
      
      task :readme do
        txt = File.read(File.join(FileUtils.pwd, 'README.textile'))
        plain = File.join(FileUtils.pwd, 'README')

        # txt.gsub!(/[\s](@\S+@)[\s]/, "<tt>#{$1}</tt>")
        txt.scan(/[\s]@(\S+)@[\s|\.]/).flatten.each do |word|
          # puts "replacing: @#{word}@ w/ <tt>#{word}</tt>"
          txt.gsub!("@#{word}@", "<tt>#{word}</tt>")
        end

        ['h1', 'h2', 'h3'].each_with_index do |h, i|
          txt.scan(/(#{h}.\s)/).flatten.each do |word|
            eq = '=' * (i + 1)
            # puts "replacing: '#{word}' w/ #{eq}"
            txt.gsub!(word, eq)
          end
        end

        ['<pre><code>', '</code></pre>'].each do |h|
          txt.scan(/(#{h}.*$)/).flatten.each do |word|
            # puts "replacing: '#{word}' with nothing"
            txt.gsub!(word, '')
          end
        end

        txt.gsub!("\n\n\n", "\n\n")
        File.open(plain, 'w') {|f| f.write txt}
      end

    end # gem_spec
    
    def rdoc(&block)
      Rake::RDocTask.new do |rd|
        rd.main = "README"
        files = Dir.glob("**/*.rb")
        if rspec?
          files = files.collect {|f| f unless f.match("spec/") || f.match("doc/") }.compact
        elsif test_unit?
          files = files.collect {|f| f unless f.match("test/") || f.match("doc/") }.compact
        end
        files << 'README'
        files << 'LICENSE'
        rd.rdoc_files = files
        rd.rdoc_dir = "doc"
        rd.options << "--line-numbers"
        rd.options << "--inline-source"
        rd.title = "content_o_matic"
        yield rd if block_given?
      end
      
      task :doc => [:readme, :rerdoc]
    end
    
  end # class << self
  
end # Gemstub

Gemstub.rdoc