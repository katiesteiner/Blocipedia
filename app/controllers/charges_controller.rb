class ChargesController < ApplicationController
  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
      )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: Amount.default,
      description: "BigMoney Membership - #{current_user.email}",
      currency: 'usd' 
      )

    flash[:notice] = "Thank you for your payment! Your account has now been upgraded to Premium."
    redirect_to user_path(current_user)
  end

  rescue Stripe::CardError => e
    flash.now[:alert] = e.message
    redirect_to new_charge_path
  end
end