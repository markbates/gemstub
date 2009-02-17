module Gemstub
  module Tools
    
    class << self
      
      # 
      def load_gems(group = 'all')
        
      end
      
      def load_gem(name)
        
      end
      
      def require_gems(group = 'all')
        
      end
      
      def require_gem(name)
        
      end
      
      def install_gems(group = 'all')
        
      end
      
      def yaml_search_paths
        paths = %w{config .}
        if Object.const_defined?('RAILS_ROOT')
          paths << File.join(RAILS_ROOT, 'config')
        end
        paths
      end
      
    end # class << self
    
  end # Tools
end # Gemstub