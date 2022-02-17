class HardJob < ApplicationJob


  def perform(order_id)
      Api::V1::Order.find(order_id).update(payment_status: "oral sex")
  end
end
