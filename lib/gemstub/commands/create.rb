app = ARGV[0]
raise "You must specify a name for this gem!" if app.nil?

options = OpenStruct.new
options.version = "0.0.1"
options.author = (ENV["USERNAME"] || ENV["USER"])
options.force = false

opts = OptionParser.new do |opts|
  opts.banner = "Usage: gemstub create [options]"
  
  opts.on("-v [initial version]") do |v|
    options.version = v
  end
  
  opts.on("-a [author name]") do |v|
    options.author = v
  end
  
  opts.on("-f [force]") do |v|
    options.force = true
  end
  
end

opts.parse!(ARGV)

# puts "options = #{options.inspect}"

app = app.downcase.gsub(" ", "_")

if options.force
  begin
    FileUtils.rm_rf app
  rescue Exception => e
    puts e
  end
end

require File.join(File.dirname(__FILE__), "..", 'gem_generator', 'gem_generator')

GemGenerator.run("app" => app, "version" => options.version, "author" => options.author)