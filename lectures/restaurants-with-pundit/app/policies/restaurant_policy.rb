class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(user: user)
      scope.all
    end
  end

  def create?
    true
  end

  # def new?
  #   create?
  # end

  def show?
    true
  end

  # def edit?
  #   update?
  # end

  def update?
    # In the Pundit policy file, current_user => user, @restaurant => record
    # @restaurant.user == current_user, becomes:
    user_is_owner? || user_is_admin?
  end

  def destroy?
    user_is_owner? || user_is_admin?
  end

  private

  def user_is_owner?
    record.user == user
  end

  def user_is_admin?
    user.admin?
  end
end
