require 'minitest/autorun'
require 'minitest/pride'
require './currency'
require './currency_converter'
#
class CurrencyConverterTest < ::MiniTest::Test

  def test_currency_class_exists
    assert CurrencyConverter
  end

  def test_currency_converter_initializes_with_a_hash
    rates_hash = { :USD => 1.0, :EUR => 0.74 }
    converter = CurrencyConverter.new(rates_hash)
  end

  def test_currency_convert_method_returns_new_object_with_same_amount_and_code
    rates_hash = { :USD => 1.0, :EUR => 0.74 }
    converter = CurrencyConverter.new(rates_hash)
    assert_equal Currency.new(1, :USD), converter.convert(Currency.new(1, :USD), :USD)
  end

  def test_currency_convert_method_returns_new_object_with_different_code
    rates_hash = { :USD => 1.0, :EUR => 0.74 }
    converter = CurrencyConverter.new(rates_hash)
    assert_equal Currency.new(0.74, :EUR), converter.convert(Currency.new(1, :USD), :EUR)
  end

  def test_currency_convert_method_processes_more_codes
    rates_hash = { :USD => 1.0, :EUR => 0.74, :JPY => 120.0, :CAN => 10.0 }
    converter = CurrencyConverter.new(rates_hash)
    assert_equal Currency.new(120, :JPY), converter.convert(Currency.new(10, :CAN), :JPY)
  end


end