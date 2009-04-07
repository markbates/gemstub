require File.dirname(__FILE__) + '/../../spec_helper'

describe Gemstub::Tools::GemManager do
  
  it 'should place all GemObjects into the all group' do
    pending do
      manager.group(:all).should have(6).gem_objects
    end
  end
  
  it 'should place gems into groups based on their yaml file' do
    pending do
      manager.group(:all).should have(6).gem_objects
      manager.group(:development).should have(6).gem_objects
      manager.group(:production).should have(8).gem_objects
      manager.group(:test).should have(8).gem_objects
      manager.group(:fubar).should have(2).gem_objects
    end
  end
  
  it 'should configure a source if specified' do
    manager.source.should == 'http://gems.example.com'
  end
  
  it 'should default to the gem_command gem if no command is specified' do
    manager.gem_command.should == 'gem'
  end
  
  it 'should raise an error if the gems.yml does not exist' do
    FileUtils.stub!(:pwd).and_return('/')
    lambda {Gemstub::Tools::GemManager.instance.reset!}.should raise_error(ArgumentError)#('Oops! Could not find a gems.yml file')
  end
  
  describe 'group' do
    
    it 'should return a group if no block is given' do
      group = manager.group(:pickles)
      group.should be_kind_of(Gemstub::Tools::GemGroup)
      group.should === manager.group(:pickles)
    end
    
    it 'should yield a group if a block is given' do
      manager.group(:toothpicks) do |group|
        group.should be_kind_of(Gemstub::Tools::GemGroup)
        group.name.should == :toothpicks
      end
    end
    
  end
  
end
