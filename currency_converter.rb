module Rates
  RATES_HASH = { :USD => 1.0, :EUR => 0.74 }
end


class CurrencyConverter

  include Rates

  attr_accessor :rates
    def initialize(rates)
    @rates = rates
  end

  def convert(currency, new_code)
    current_amount = currency.amount
    current_code = currency.code

    RATES_HASH.each do |key, value|
      if key == current_code
        currency = Currency.new(current_amount * value, new_code)
      end
      return currency
    end

  end

end