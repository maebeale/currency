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
    else
      total = (current_amount / rates[current_code]) * rates[new_code]
      Currency.new(total, new_code)
    end

  end

end