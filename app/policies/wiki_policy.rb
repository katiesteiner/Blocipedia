class WikiPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.private != true || (user.present? && ((user.role == 'admin') || record.user == user) || record.users.include?(user))
  end

  def update?
    show?
  end

  def edit?
    show?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.role == 'admin'
        scope.all
      elsif user.role == 'premium'
        scope.where(:public => true || wiki.user == user || wiki.collaborated_users.include?(user))
      else
        scope.where(:public => true)
      end
    end
  end
end