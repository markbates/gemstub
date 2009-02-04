require File.dirname(__FILE__) + '/../../spec_helper'

describe YamlGenerator do
  
  it 'should generate a YAML file in the config directory' do
    YamlGenerator.run
    path = File.expand_path(File.join($genosaurus_output_directory, 'config', 'gems.yml'))
    File.should be_exist(path)
    File.read(path).should match_fixture('gems.yml')
  end
  
  it 'should generate a YAML file in the specified directory' do
    YamlGenerator.run({'output_dir' => 'foo/bar'})
    path = File.expand_path(File.join($genosaurus_output_directory, 'foo/bar', 'gems.yml'))
    File.should be_exist(path)
    File.read(path).should match_fixture('gems.yml')
  end
  
end
