module Gemstub
  module Tools
    class GemGroup
      
      attr_accessor :name
      attr_accessor :gems
      
      def initialize(name = :all)
        self.name = name
        self.gems = {}
      end
      
      def add(name, options = {})
        
      end
      
      def import(name)
        
      end
      
      def remove(name)
        
      end
      
      def get(name)
        self.gems[name.to_sym]
      end
      
    end
  end
end