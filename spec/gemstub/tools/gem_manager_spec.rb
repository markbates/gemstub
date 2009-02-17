require File.dirname(__FILE__) + '/../../spec_helper'

describe Gemstub::Tools::GemManager do
  
  
  it 'should place all GemObjects into the all group' do
    pending do
      manager = Gemstub::Tools::GemManager.instance
      manager.group(:all).should have(18).gem_objects
    end
  end
  
  it 'should place gems into groups based on their yaml file' do
    pending do
      manager = Gemstub::Tools::GemManager.instance
      manager.group(:all).should have(18).gem_objects
      manager.group(:development).should have(2).gem_objects
      manager.group(:production).should have(4).gem_objects
      manager.group(:testing).should have(3).gem_objects
      manager.group(:fubar).should have(2).gem_objects
    end
  end
  
  it 'should raise an error if the gems.yml does not exist' do
    FileUtils.stub!(:pwd).and_return('/')
    lambda {Gemstub::Tools::GemManager.instance.reset!}.should raise_error(ArgumentError)#('Oops! Could not find a gems.yml file')
  end
  
end
