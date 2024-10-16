class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def process_payment
    card_number = params[:card_number]
    expiry_date = params[:expiry_date]
    cvc = params[:cvc]

    if fake_stripe_payment_successful?(card_number, expiry_date, cvc)
      current_user.update(payment_status: 'paid') # Update user's payment status
      redirect_to projects_path, notice: "Payment processed successfully!"
    else
      redirect_to new_payment_path, alert: "Payment failed. Please try again."
    end
  end

  private

  def fake_stripe_payment_successful?(card_number, expiry_date, cvc)
    true # Simulate success
  end
end
