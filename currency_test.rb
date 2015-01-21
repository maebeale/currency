require 'minitest/autorun'
require 'minitest/pride'
require './currency'
#
class CurrencyTest < ::MiniTest::Test

  def test_currency_class_exists
    assert Currency
  end

  def test_currency_has_amount_and_code
    currency = Currency.new(5, :usd)
    assert currency.amount == 5
    assert currency.code == :usd
  end

  def test_currency_matches
    currency1 = Currency.new(5, :usd)
    currency2 = Currency.new(5, :usd)
    currency3 = Currency.new(6, :usd)
    currency4 = Currency.new(5, :can)

    assert_equal currency1, currency2
    refute currency1.==(currency3)
    refute currency1 == currency4
  end

  def test_currency_of_same_code_is_additive
    currency1 = Currency.new(5, :usd)
    currency2 = Currency.new(5, :usd)
    currency3 = Currency.new(6, :usd)
    currency4 = Currency.new(5, :can)

    assert_equal 11, (currency1 + currency3).amount
    assert_equal :usd, (currency1 + currency3).code
    # assert_not_equal 10, (currency1 + currency4).amount
    # assert_not_equal :can, (currency1 + currency3).code
  end

  def test_currency_of_same_code_is_subtractive
    currency1 = Currency.new(5, :usd)
    currency2 = Currency.new(8, :usd)
    currency3 = Currency.new(6, :usd)
    currency4 = Currency.new(5, :can)

    assert_equal 3, (currency2 - currency1).amount
    assert_equal :usd, (currency2 - currency1).code
  end

  def test_raises_error_when_code_doesnt_match
    currency1 = Currency.new(5, :usd)
    currency2 = Currency.new(5, :usd)
    currency3 = Currency.new(6, :usd)
    currency4 = Currency.new(5, :can)

    begin
      currency1 + currency4
    rescue Exception => exception
      assert_equal "Can't do that, yo", exception.message
    end

    begin
      currency1 - currency4
    rescue Exception => exception
      assert_equal "Can't do that, yo", exception.message
    end
      # assert_raise (RuntimeError) do #TODO figure out assert_raise syntax
      #   (currency1 + currency4).amount
      # end
  end

  def test_returns_currency_when_multiplied_by_fixnum_or_float
    currency1 = Currency.new(5, :usd)
    currency2 = Currency.new(5, :usd)
    currency3 = Currency.new(6, :usd)
    currency4 = Currency.new(5, :can)

    assert_equal 25, (currency1 * 5).amount
    assert_equal :usd, (currency1 * 5).code
    assert_equal 25.62, (currency1 * 5.1234).amount

  end

end


