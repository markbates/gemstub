module Gemstub
  module Tools
    
    class GemManager
      include Singleton
      
      attr_accessor :gem_groups
      
      def initialize
        self.reset!
      end
      
      def group(name)
        self.gem_groups[name.to_sym] ||= []
      end
      
      def reset!
        self.gem_groups = {}
        found_yml = false
        Gemstub::Tools.yaml_search_paths.each do |dir|
          path = File.expand_path(File.join(FileUtils.pwd, dir, 'gems.yml'))
          if File.exists?(path)
            found_yml = true
            break
          end
        end
        raise ArgumentError.new('Oops! Could not find a gems.yml file') unless found_yml
      end
      
    end # GemManager
      
  end # Tools
end # Gemstub