class FilterWikis

  def self.call(user)
    case user.role.to_sym
    when :admin
      Wiki.all
    when :premium
      user.all_wikis
    else
      Wiki.where('user_id = ? OR private = ?', user.id, false)
    end
  end

end