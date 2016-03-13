class UsersController < ApplicationController
  before_action :authenticate_user!

  def downgrade
    @user = current_user
    @user.role = "standard"
    @user.save!
    @wikis = Wiki.where(private: true, user_id: @user.id)
    @wikis.each do |wiki|
      wiki.private = false
      wiki.save!
    end
    if current_user.update(role: 'standard')
      flash[:notice] = "Account was downgraded successfully."
    else
      flash[:error] = "There was an error, please try again."
    end
  redirect_to edit_user_registration_path
  end
end