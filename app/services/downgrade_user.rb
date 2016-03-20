class DowngradeUser

  def self.call(user)
    user.wikis.each { |w| w.update(private: false) }
  end
  
end