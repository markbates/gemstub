require File.dirname(__FILE__) + '/../spec_helper'

describe Gemstub::Tools do
  
  describe 'yaml_search_paths' do
    
    it 'should return an array of search paths' do
      Gemstub::Tools.yaml_search_paths.should have(2).things
      Gemstub::Tools.yaml_search_paths.should include('.')
      Gemstub::Tools.yaml_search_paths.should include('config')
    end
    
    it 'should append RAILS_ROOT to the search paths if defined' do
      Object.should_not be_const_defined('RAILS_ROOT')
      RAILS_ROOT = 'foo'
      Object.should be_const_defined('RAILS_ROOT')
      Gemstub::Tools.yaml_search_paths.should have(3).things
      Gemstub::Tools.yaml_search_paths.should include('.')
      Gemstub::Tools.yaml_search_paths.should include('config')
      Gemstub::Tools.yaml_search_paths.should include('foo/config')
      Object.should be_const_defined('RAILS_ROOT')
      Object.send(:remove_const, 'RAILS_ROOT')
      Object.should_not be_const_defined('RAILS_ROOT')
    end
    
  end
  
  describe 'load_gems' do
    
    it 'should load all the gems defined in the yaml file by default'
    
    it 'should load specific gems defined in a group in the yaml file'
    
  end
  
  describe 'load_gem' do
    
    it 'should load a specific gem'
    
    it 'should raise an exception if the gem isnt installed'
    
  end
  
  describe 'require_gems' do
    
    it 'should load and require all the gems defined in the yaml file by default'
    
    it 'should load and require specific gems defined in a group in the yaml file'
    
  end
  
  describe 'require_gem' do
    
    it 'should load and require a specific gem'
    
  end
  
end
