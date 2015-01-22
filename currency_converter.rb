require './errors'

class CurrencyConverter
  attr_accessor :rates

    def initialize(rates)
    @rates = rates
  end

  def convert(currency, new_code)
    current_amount = currency.amount
    current_code = currency.code

    if current_code == new_code
      currency
    elsif current_code != new_code && @rates.include?(new_code) && @rates.include?(current_code)
      new_amount = ((current_amount / rates[current_code]) * rates[new_code]).round(2)
      Currency.new(new_amount, new_code)
    else
      raise UnknownCurrencyCodeError, "Unknown Currency Code. We'll need to update our hash."
    end

  end

end

