module Gemstub
  module Tools
    
    class GemManager
      include Singleton
      
      attr_accessor :gem_groups
      attr_accessor :source
      attr_accessor :gem_command
      
      def initialize
        self.reset!
      end
      
      def group(name)
        gp = self.gem_groups[name.to_sym] ||= Gemstub::Tools::GemGroup.new(name.to_sym)
        if block_given?
          yield gp
          self.gem_groups[name.to_sym] = gp
        end
        gp
      end
      
      def reset!
        self.gem_groups = {}
        
        eval(find_rb, binding)
        
        # self.source = gem_config['source']
        # self.gem_command = gem_config['gem_command'] || 'gem'
      end
      
      private
      def find_rb
        Gemstub::Tools.yaml_search_paths.each do |dir|
          path = File.expand_path(File.join(FileUtils.pwd, dir, 'gems.rb'))
          if File.exists?(path)
            return File.read(path)
          end
        end
        raise ArgumentError.new('Oops! Could not find a gems.rb file')
      end
      
    end # GemManager
      
  end # Tools
end # Gemstub