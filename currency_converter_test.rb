require 'minitest/autorun'
require 'minitest/pride'
require './currency_converter'
#
class CurrencyConverterTest < ::MiniTest::Test

  def test_currency_class_exists
    assert CurrencyConverter
  end

  def test_currency_converter_initializes_with_a_hash
    hash = Hash.new
    converter = CurrencyConverter.new(hash)
    


  end
end