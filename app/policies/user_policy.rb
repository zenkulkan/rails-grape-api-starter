# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  # Define policies for different actions on the User model

  def index?
    user.present? && user.admin? # Only allow admins to view the list of all users
  end

  def show?
    user.present? && (record == user || user.admin?) # Allow users to view their own profile or admins to view any profile
  end

  def create?
    user.present? && user.admin? # Only allow admins to create new users
  end

  def update?
    user.present? && (record == user || user.admin?) # Allow users to update their own profile or admins to update any profile
  end

  def destroy?
    user.present? && user.admin? # Only allow admins to delete users
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all # Admins can see all users
      else
        scope.where(id: user.id) # Non-admins can only see their own profile
      end
    end
  end
end
