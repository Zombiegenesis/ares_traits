module AresMUSH
  module Traits
    class TraitsViewCmd
      include CommandHandler
      
      attr_accessor :name
	  
      def required_args
        [self.name]
      end

      def parse_args
        self.name = cmd.args ? titlecase_arg(cmd.args) : enactor_name
      end   
      
      def handle
        ClassTargetFinder.with_a_character(self.name, client, enactor) do |model|
          template = BorderedDisplayTemplate.new model.traits, "#{model.name}'s Traits"
          client.emit template.render
        end
      end
    end
  end
end