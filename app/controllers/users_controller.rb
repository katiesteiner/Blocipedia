class UsersController < ApplicationController
  before_action :authenticate_user!

  def downgrade
    if current_user.update(role: 'standard')
      flash[:notice] = "Account was downgraded successfully."
    else
      flash[:error] = "There was an error, please try again."
    end
  redirect_to edit_user_registration_path
  end
end