module AresMUSH
  module Traits
    class SetTraitsCmd
      include CommandHandler
      
      attr_accessor :cg_traits

      def parse_args
       self.cg_traits = trim_arg(cmd.args)
      end

      def handle
        enactor.update(cg_traits: self.cg_traits)
        client.emit_success "Traits set!"
      end
    end
  end
end