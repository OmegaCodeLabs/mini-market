class ItemPolicy < ApplicationPolicy
  # Everyone can view the items index
  def index?
    true
  end

  # Everyone can view individual items
  def show?
    true
  end

  # Only admins can create items
  def create?
    user&.admin?
  end

  # Only admins can update items
  def update?
    user&.admin?
  end

  # Only admins can destroy items
  def destroy?
    user&.admin?
  end

  # Scope for listing items - show all active items to everyone
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user&.admin?
        # Admins see all items (including inactive)
        scope.all
      else
        # Customers only see active items
        scope.where(active: true)
      end
    end
  end
end
