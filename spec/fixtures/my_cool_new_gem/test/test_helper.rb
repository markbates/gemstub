require 'rubygems'
begin
require 'shoulda'
require 'mocha'
rescue LoadError
end

require File.join(File.dirname(__FILE__), '..', 'lib', 'my_cool_new_gem')
