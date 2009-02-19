require File.dirname(__FILE__) + '/../../spec_helper'

describe GemGenerator do
  
  it 'should require the parameter app' do
    lambda {GemGenerator.run}.should raise_error(ArgumentError)
    lambda {GemGenerator.run('app' => 'foo')}.should_not raise_error(ArgumentError)
  end

  it 'should generate a stub of a gem' do
    GemGenerator.run('app' => 'my_cool_new_gem', 'author' => 'markbates')
    out_base_path = File.join($genosaurus_output_directory, 'my_cool_new_gem')
    %w{ 
       README 
       lib/my_cool_new_gem.rb
       lib/my_cool_new_gem/my_cool_new_gem.rb}.each do |f|
      File.read(File.join(out_base_path, f)).should match_fixture("my_cool_new_gem/#{f}")
    end
    File.read(File.join(out_base_path, "Rakefile")).should match_fixture("my_cool_new_gem/Rakefile.rspec")
  end

  it 'should generate the stub of a gem and default to rspec tests' do
    GemGenerator.run('app' => 'my_cool_new_gem', 'author' => 'markbates')
    out_base_path = File.join($genosaurus_output_directory, 'my_cool_new_gem')
    %w{ 
       README 
       lib/my_cool_new_gem.rb
       lib/my_cool_new_gem/my_cool_new_gem.rb
       spec/spec.opts
       spec/spec_helper.rb
       spec/lib/my_cool_new_gem/my_cool_new_gem_spec.rb}.each do |f|
      File.read(File.join(out_base_path, f)).should match_fixture("my_cool_new_gem/#{f}")
    end
    File.read(File.join(out_base_path, "Rakefile")).should match_fixture("my_cool_new_gem/Rakefile.rspec")
  end

  it 'should generate the stub of a gem and use test unit tests' do
    GemGenerator.run('app' => 'my_cool_new_gem', 'author' => 'markbates', 'test' => 'unit')
    out_base_path = File.join($genosaurus_output_directory, 'my_cool_new_gem')
    %w{ 
       README 
       lib/my_cool_new_gem.rb
       lib/my_cool_new_gem/my_cool_new_gem.rb
       test/test_helper.rb
       test/unit/test_my_cool_new_gem.rb}.each do |f|
      File.read(File.join(out_base_path, f)).should match_fixture("my_cool_new_gem/#{f}")
    end
    File.read(File.join(out_base_path, "Rakefile")).should match_fixture("my_cool_new_gem/Rakefile.unit")
  end
  
end
