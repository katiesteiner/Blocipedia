class FilterWikis

  def self.call(user)
    case user.role
    when 'admin'
      Wiki.all
    when 'premium'
      Wiki.where('user_id = ? OR private = ?', user.id, true) + user.wiki_collaborations
    else
      Wiki.where('user_id = ? OR priavete = ?', user.id, false)
    end
  end

end