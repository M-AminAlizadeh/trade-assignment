class Order < ApplicationRecord
  scope :completed_buy_orders, -> { where(order_type: 'buy', status: 'completed') }
end
