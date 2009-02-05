output_dir = ARGV.delete(ARGV.first) || 'config'

require File.join(File.dirname(__FILE__), "..", 'yaml_generator', 'yaml_generator')

YamlGenerator.run('output_dir' => output_dir)