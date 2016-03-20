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

  def destroy?
    record.user == user || user.role == 'admin'
  end

  def can_add_collaborators?
    record.private? && user.present? && user.premium? && record.user == user
  end


end