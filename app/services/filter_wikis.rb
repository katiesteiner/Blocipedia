class FilterWikis
  def self.call(user)
    case user.role.to_sym
    when :admin
      Wiki.all
    when :premium
      Wiki.where('user_id = ? OR private = ?', user.id, false) + user.wiki_collaborators
    else
      Wiki.where(private: false)
    end
  end
end
