class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.name}",
      amount: @amount
    }
  end

  def create

    @amount = 1500

    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
      )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "BigMoney Membership - #{current_user.email}",
      currency: 'usd' 
      )

    if current_user.update(role: 'premium')
      flash[:success] = "Thank you for upgrading to Premium, #{current_user.email}!"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "There was an error upgrading your account."
      redirect_to edit_user_registration_path
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end