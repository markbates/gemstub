require File.dirname(__FILE__) + '/../../spec_helper'

describe GemGenerator do
  
  it 'should require the parameter app' do
    lambda {GemGenerator.run}.should raise_error(ArgumentError)
    lambda {GemGenerator.run('app' => 'foo')}.should_not raise_error(ArgumentError)
  end
  
  it 'should generate the stub of a gem' do
    GemGenerator.run('app' => 'my_cool_new_gem', 'author' => 'markbates')
    out_base_path = File.join($genosaurus_output_directory, 'my_cool_new_gem')
    %w{Rakefile 
       README 
       lib/my_cool_new_gem.rb
       lib/my_cool_new_gem/my_cool_new_gem.rb
       spec/spec.opts
       spec/spec_helper.rb
       spec/lib/my_cool_new_gem/my_cool_new_gem_spec.rb}.each do |f|
      File.read(File.join(out_base_path, f)).should match_fixture("my_cool_new_gem/#{f}")
    end
  end
  
end
