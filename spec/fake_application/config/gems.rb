gem_source = 'http://gems.example.com'
# gem_command = 'gem'

group(:all) do |g|
  g.add :RedCloth, :version => '3.0.4'
  g.add :RubyInline, :version => '3.6.6', :files => ['inline']
  g.add :chronic, :require => false
  g.add :gbarcode, :source => 'http://gems.example.org', :version => '0.98.16'
  g.add 'memcache-client', :version => '1.5.0', :files => 'memcache'
  g.add 'mislav-will_paginate', :version => '2.3.2', :files => ['will_paginate', 'will_paginate/collection', 'will_paginate/array']
end

group(:production) do |g|
  g.import :all
  g.add :bjobber, :version => '1.0.1'
  g.add :soap4r, :require => false
end

group(:development) do |g|
  g.import :all
end

group(:test) do |g|
  g.import :all
  g.add :cucumber, :version => '>=0.1.13'
  g.add 'rspec-rails', :version => '1.1.12'
  g.add 'thoughtbot-factory_girl', :version => '1.1.2'
  g.remove 'memcache-client'
end

group(:fubar) do |g|
  g.add :fastercsv, :version => '1.2.3'
  g.add 'pdf-writer', :version => '1.1.7', :files => 'pdf/writer'
end