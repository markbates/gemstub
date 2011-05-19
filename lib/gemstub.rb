require 'active_support'
require 'mark_facets'
require 'genosaurus'
# require "mack-facets"
require File.join(File.dirname(__FILE__), 'gemstub', 'gem_generator', 'gem_generator')

require 'rake'
require 'rake/gempackagetask'
require 'rake/clean'
require 'rake/testtask'
require 'rake/rdoctask'
require 'find'
# require 'rubyforge'
require 'rubygems'
require 'rubygems/gem_runner'
# require 'spec'
# require 'spec/rake/spectask'
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
        require 'rspec/core'
        require 'rspec/core/rake_task'
        desc 'Run specifications'
        RSpec::Core::RakeTask.new(:default) do |t|
          # opts = File.join('spec', 'spec.opts')
          # t.spec_opts << '--options' << opts if File.exists?(opts)
          # t.spec_files = Dir.glob('spec/**/*_spec.rb')
          t.pattern = 'spec/**/*_spec.rb'
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
        s.files = FileList['lib/**/*.*', 'LICENSE', 'bin/**/*.*']
        s.require_paths = ['lib']
        s.bindir = 'bin'
        s.extra_rdoc_files = ['LICENSE']
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
      task :gemspec do
        @gem_spec.version = "#{@gem_spec.version}.#{Time.now.strftime('%Y%m%d%H%M%S')}"
        File.open(File.join("#{@gem_spec.name}.gemspec"), 'w') {|f| f.puts @gem_spec.to_ruby}
      end

      desc "Install the gem"
      task :install => [:package] do |t|
        sudo = ENV['SUDOLESS'] == 'true' || RUBY_PLATFORM =~ /win32|cygwin/ ? '' : 'sudo'
        puts `#{sudo} gem install #{File.join("pkg", @gem_spec.name)}-#{@gem_spec.version}.gem --no-update-sources --no-ri --no-rdoc`
      end

      desc "Release the gem"
      task :release => :install do |t|
        gem_pkg = File.join("pkg", "#{@gem_spec.name}-#{@gem_spec.version}.gem")
        system "gem push #{gem_pkg}"
      end
      
      # task :readme do
      #   txt = File.read(File.join(FileUtils.pwd, 'README.textile'))
      #   plain = File.join(FileUtils.pwd, 'README')
      # 
      #   # txt.gsub!(/[\s](@\S+@)[\s]/, "<tt>#{$1}</tt>")
      #   txt.scan(/[\s]@(\S+)@[\s|\.]/).flatten.each do |word|
      #     # puts "replacing: @#{word}@ w/ <tt>#{word}</tt>"
      #     txt.gsub!("@#{word}@", "<tt>#{word}</tt>")
      #   end
      # 
      #   ['h1', 'h2', 'h3', 'h4'].each_with_index do |h, i|
      #     txt.scan(/(#{h}.\s)/).flatten.each do |word|
      #       eq = '=' * (i + 1)
      #       # puts "replacing: '#{word}' w/ #{eq}"
      #       txt.gsub!(word, eq)
      #     end
      #   end
      # 
      #   ['<pre><code>', '</code></pre>'].each do |h|
      #     txt.scan(/(#{h}.*$)/).flatten.each do |word|
      #       # puts "replacing: '#{word}' with nothing"
      #       txt.gsub!(word, '')
      #     end
      #   end
      # 
      #   txt.gsub!("\n\n\n", "\n\n")
      #   File.open(plain, 'w') {|f| f.write txt}
      # end

    end # gem_spec
    
    def rdoc(&block)
      Rake::RDocTask.new do |rd|
        rd.rdoc_files = Dir.glob(File.join('lib', '**', '*.rb'))
        rd.rdoc_files << 'LICENSE'
        rd.rdoc_dir = "doc"
        rd.options << "--line-numbers"
        rd.options << "--inline-source"
        rd.title = "content_o_matic"
        yield rd if block_given?
      end
      
      task :doc => [:rerdoc]
    end
    
  end # class << self
  
end # Gemstub

Gemstub.rdoc