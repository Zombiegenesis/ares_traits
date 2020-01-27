$:.unshift File.dirname(__FILE__)

module AresMUSH
  module Traits
    def self.plugin_dir
      File.dirname(__FILE__)
    end
 
    def self.shortcuts
      Global.read_config("traits", "shortcuts")
    end
 
    def self.get_cmd_handler(client, cmd, enactor)    
      case cmd.root
      when "traits"
        case cmd.switch
        when "set"
         return SetTraitsCmd
		else
		 return TraitsViewCmd
        end
      end	
      return nil
    end
  end
end