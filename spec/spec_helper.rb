require 'rubygems'
require 'spec'
require 'fileutils'

$genosaurus_output_directory = File.join(File.dirname(__FILE__), 'tmp')

require File.join(File.dirname(__FILE__), '..', 'lib', 'gemstub')

Spec::Runner.configure do |config|
  
  config.before(:all) do
  end
  
  config.after(:all) do
  end
  
  config.before(:each) do
    cleanup
  end
  
  config.after(:each) do
    cleanup
  end
  
  def cleanup
    FileUtils.stub!(:pwd).and_return(File.dirname(__FILE__))
    FileUtils.rm_rf($genosaurus_output_directory)
    Gemstub::Tools::GemManager.instance.reset!
  end
  
end

# def fixture(name)
#   File.read(File.join(File.dirname(__FILE__), 'fixtures', name))
# end

class MatchFixture
  def initialize(expected)
    @expected = File.read(File.join(File.dirname(__FILE__), 'fixtures', expected)).strip
  end

  def matches?(actual)
    @actual = actual
    @actual.strip! unless @actual.nil?
    # Satisfy expectation here. Return false or raise an error if it's not met.
    @actual.should == @expected
    true
  end

  def failure_message
    "expected #{@actual.inspect} to match_fixture #{@expected.inspect}, but it didn't"
  end

  def negative_failure_message
    "expected #{@actual.inspect} not to match_fixture #{@expected.inspect}, but it did"
  end
end

def match_fixture(expected)
  MatchFixture.new(expected)
end