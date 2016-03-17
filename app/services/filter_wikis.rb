class FilterWikis
  def self.call(user)
    case user.role.to_sym
    when :admin
      Wiki.all
    when :premium
      Wiki.where(:private => true || wiki.user == user || wiki.collaborated_users.include?(user)) + Wiki.where('user_id = ? OR private = ?', user.id, false)
    else
      Wiki.where('user_id = ? OR private = ?', user.id, true) + Wiki.where('user_id = ? OR private = ?', user.id, false) + user.wiki_collaborators
    end
  end
end

