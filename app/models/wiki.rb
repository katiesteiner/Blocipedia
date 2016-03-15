class Wiki < ActiveRecord::Base
  belongs_to :user

  default_scope { order('created_at DESC') }
  scope :visible_to, -> (user) { user ? all : where(public: true) }
  #scope :visible_to, -> (user) { user && ((user.role == 'premium') || (user.role == 'admin')) ? all : where((private == false) || (private == nil)) }
end
