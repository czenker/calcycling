require 'date'
require 'holidays'

module CalRecycling
  class Year
    attr_reader :year

    def initialize year
      @year = year
    end

    def first_day
      Date.new(@year, 1, 1).cwday
    end

    def days
      Date.leap?(@year) ? 366 : 365
    end

    def easter
      Holidays.easter(@year).strftime('%m-%d')
    end

    def to_i
      @year.to_i
    end

    def == other
      self.to_i == other.to_i
    end
  end
end