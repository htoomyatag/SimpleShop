class CheckoutController < ApplicationController

require 'active_merchant'
require 'money'
require 'eu_central_bank'


  def payment_option



  end

  def exchange_currency(order_total,currency_code)
    bank = EuCentralBank.new
    bank.update_rates if bank.last_updated.blank? || bank.last_updated < 1.day.ago
    Money.default_bank = bank   
    Money.new(order_total,currency_code).exchange_to('USD')
  end

  def purchase

    # Use the TrustCommerce test servers
    ActiveMerchant::Billing::Base.mode = :test

    gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
                :login => 'TestMerchant',
                :password => 'password')

    # ActiveMerchant accepts all amounts as Integer values in cents
    order_total = (params[:order_total].to_f*100).to_i
    currency_code = params[:currency_code]
    amount_in_usd = exchange_currency(order_total,currency_code)
 
  
    # The card verification value is also known as CVV2, CVC2, or CID
    credit_card = ActiveMerchant::Billing::CreditCard.new(
                    :first_name         =>  params[:first_name],
                    :last_name          =>  params[:last_name],
                    :number             =>  params[:number],
                    :month              =>  params[:month],
                    :year               =>  params[:year],
                    :verification_value => params[:verification_value])

    # Validating the card automatically detects the card type
    if credit_card.validate.empty?
      # Capture $10 from the credit card
      response = gateway.purchase(amount_in_usd, credit_card)

      if response.success?
        puts "Successfully charged $#{amount_in_usd} to the credit card #{credit_card.display_number}"
        # @order = Api::V1::Order.find(params[:order_id])
        # @order.payment_status = "paid"
        # @order.paid_at = Time.now
        # @order.save.set(wait: 1.minute).perform_later
      else
        raise StandardError, response.message
      end
    end


  end
end
