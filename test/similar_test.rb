require "test/unit"
require_relative "../lib/calrecycling"

class MyTest < Test::Unit::TestCase

  def test_basic
    year = CalRecycling::Year.new 2014

    other_years = CalRecycling.similar(year, 1950..2050)

    assert_equal(2003, other_years.first, '2014 can reuse calendar form 2003')
  end

  def test_does_not_contain_self
    year = CalRecycling::Year.new 2014

    other_years = CalRecycling.similar(year, 1950..2050)

    other_years.each do |other_year|
      assert_not_equal(2014, other_year)
    end
  end

end