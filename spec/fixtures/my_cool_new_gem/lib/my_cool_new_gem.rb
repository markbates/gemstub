Dir.glob(File.join(File.dirname(__FILE__), 'my_cool_new_gem', '**/*.rb')).each do |f|
  require File.expand_path(f)
end
