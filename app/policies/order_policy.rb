class OrderPolicy < ApplicationPolicy
  # Everyone can view the orders index (but scope limits what they see)
  def index?
    true
  end

  # Users can view their own orders, admins can view any order
  def show?
    user&.admin? || record.user_id == user&.id
  end

  # Anyone logged in can create an order (from their own cart)
  def create?
    user.present?
  end

  # Only admins can update orders (change status, shipping info, etc.)
  def update?
    user&.admin?
  end

  # Users can cancel their own pending orders, admins can cancel any order
  def cancel?
    return false unless record.cancellable?
    user&.admin? || record.user_id == user&.id
  end

  # Orders should never be destroyed (keep for records/accounting)
  def destroy?
    false
  end

  # Scope for listing orders
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user&.admin?
        scope.all  # Admins see all orders
      elsif user
        scope.where(user_id: user.id)  # Users see only their orders
      else
        scope.none  # Guests see no orders
      end
    end
  end
end
