class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def main?
    record == user
  end
  
  def respond_json?
    user
  end  
end
