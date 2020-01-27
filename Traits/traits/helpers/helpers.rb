module AresMUSH
  module Traits
  
    def self.can_manage_abilities?(actor)
      return false if !actor
      actor.has_permission?("manage_apps")
    end
  
  end
end