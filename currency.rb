require './errors'

class Currency

  attr_reader :amount, :code

  def initialize(amount, code)
    @amount = amount
    @code = code
  end

  def ==(other)
    self.amount == other.amount && self.code == other.code
  end

  def +(other)
    if self.code == other.code
      sum = self.amount + other.amount
      Currency.new(sum, self.code)
    else
      raise "Can't do that, yo"
    end
  end

  def -(other)
    if self.code == other.code
      difference = self.amount - other.amount
      Currency.new(difference, self.code)
    else
      raise "Can't do that, yo"
    end
  end

  def *(number)
    if number.class == Fixnum
      product = self.amount * number
      Currency.new(product, self.code)
    elsif number.class == Float
      product = self.amount * number
      Currency.new(product.round(2), self.code)
    else
      raise "Can't do that, yo"
    end
  end




end

# a = Currency.new(10, :usd)
# b = Currency.new(10, :usd)
#
# puts a
# puts b
# puts "a == b is: #{a == b}"