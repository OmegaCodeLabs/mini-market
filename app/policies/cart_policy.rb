class CartPolicy < ApplicationPolicy
  # Users can only view their own cart, admins can view any cart
  def show?
    user&.admin? || record.user_id == user&.id
  end

  # Users can update their own cart (add/remove items)
  def update?
    user&.admin? || record.user_id == user&.id
  end

  # No one should manually create carts (auto-created with users)
  def create?
    false
  end

  # No one should manually destroy carts (destroyed with users)
  def destroy?
    false
  end

  # Scope for listing carts
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user&.admin?
        scope.all  # Admins see all carts
      else
        scope.where(user_id: user&.id)  # Users see only their cart
      end
    end
  end
end
