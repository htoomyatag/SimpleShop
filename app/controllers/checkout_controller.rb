class CheckoutController < ApplicationController

require 'active_merchant'


  def payment_option

  end

  def purchase

    # Use the TrustCommerce test servers
    ActiveMerchant::Billing::Base.mode = :test

    gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
                :login => 'TestMerchant',
                :password => 'password')

    # ActiveMerchant accepts all amounts as Integer values in cents
    amount = 1000  # $10.00

    # The card verification value is also known as CVV2, CVC2, or CID
    credit_card = ActiveMerchant::Billing::CreditCard.new(
                    :first_name         =>  params[:first_name],
                    :last_name          =>  params[:last_name],
                    :number             =>  params[:number],
                    :month              => '8',
                    :year               => Time.now.year+1,
                    :verification_value => '000')

    # Validating the card automatically detects the card type
    if credit_card.validate.empty?
      # Capture $10 from the credit card
      response = gateway.purchase(amount, credit_card)

      if response.success?
        puts "Successfully charged $#{sprintf("%.2f", amount / 100)} to the credit card #{credit_card.display_number}"
      else
        raise StandardError, response.message
      end
    end


  end
end
