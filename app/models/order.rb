class Order < ApplicationRecord
  enum order_type: { buy: 'buy', sell: 'sell' }
  enum status: { completed: 'completed', canceled: 'canceled', pending: 'pending' }

  def process_order
    if buy? && price < buy_threshold_price
      update(status: :completed)
    elsif sell? && price > sell_threshold_price
      update(status: :completed)
    else
      update(status: :canceled)
    end
  
  rescue => e
    Rails.logger.error "Error during the order: #{e.message}"
  end

  private

  def buy_threshold_price
    # for example the buy threshold price is 95
    95
  end
  
  def sell_threshold_price
    # for example the sell threshold price is 105
    105
  end
end
