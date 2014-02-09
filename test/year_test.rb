require "test/unit"
require_relative "../lib/calrecycling/year"

class YearTest < Test::Unit::TestCase

  def test_constructor
    year = CalRecycling::Year.new 2014

    assert_equal(2014, year.year)
  end

  def test_first_day
    year = CalRecycling::Year.new 2014

    # a wednesday
    assert_equal(3, year.first_day)
  end

  def test_days
    year = CalRecycling::Year.new 2014
    assert_equal(365, year.days, '2014 not a leap year')

    year = CalRecycling::Year.new 2016
    assert_equal(366, year.days, '2016 is a leap year')
  end

  def test_easter
    year = CalRecycling::Year.new 2014

    assert_equal("04-20", year.easter)
  end

  def test_equality
    year = CalRecycling::Year.new 2014
    other_year = CalRecycling::Year.new 2014

    assert(year == year, 'equal to self')
    assert(year == other_year, 'equal to other year instance with same year')
    assert(year == 2014, 'equal to a fixnum year #1')
    assert(2014 == year, 'equal to a fixnum year #2')
  end
end