class Item < ActiveRecord::Base
  belongs_to :list

  def self.pennies_from_price(raw_price)
    (raw_price.gsub('$','').to_f * 100).to_i
  end

  def price_in_dollars
    sprintf('%.2f', (price.to_f / 100).to_f) if price
  end
end
