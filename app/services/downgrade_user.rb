class DowngradeUser

  def self.call(user)
    user.wikis.find_each { |w| w.update(private: false) }
  end

end
