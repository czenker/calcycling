require "test/unit"
require_relative "../lib/calrecycling/year"

class YearTest < Test::Unit::TestCase

  def test_constructor
    year = CalRecycling::Year.new 2014

    assert_same(2014, year.year)
  end

  def test_first_day
    year = CalRecycling::Year.new 2014

    # a wednesday
    assert_same(3, year.first_day)
  end

  def test_days
    year = CalRecycling::Year.new 2014
    assert_same(365, year.days, '2014 not a leap year')

    year = CalRecycling::Year.new 2016
    assert_same(366, year.days, '2016 is a leap year')
  end
end