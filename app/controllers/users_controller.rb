class UsersController < ApplicationController
  before_action :authenticate_user!

  def downgrade
    if current_user.update(role: "standard")
      current_user.wikis.where(private: true).each do |wiki|
        wiki.update(private: false)
      end
    else
      flash[:error] = "There was an error, please try again."
    end
    redirect_to edit_user_registration_path
  end
end