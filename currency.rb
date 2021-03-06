require './errors'

class Currency
  # include SymbolsHash?
  attr_reader :amount, :code

  def initialize(*details)
    symbols_hash = {'$' => :USD, '€' => :EUR, '¥' => :JPY } #TODO - make this a module? Rework so USD & CAD can both be in hash
    if details[0].class == String
      m = details[0].match /(\W)\s*(\d+\.{0,1}\d{0,2})/
        @amount = m[2].to_f.round(2)
        @code = symbols_hash[m[1]]
    else #details[0].class == FixNum
      @amount = details[0].round(2)
      @code = details[1]
    end

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