class CategoryPolicy < ApplicationPolicy
  # Everyone can view categories
  def index?
    true
  end

  # Everyone can view individual categories
  def show?
    true
  end

  # Only admins can create categories
  def create?
    user&.admin?
  end

  # Only admins can update categories
  def update?
    user&.admin?
  end

  # Only admins can destroy categories
  def destroy?
    user&.admin?
  end

  # Scope for listing categories - everyone sees all categories
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end
