require 'date'

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
  end
end