require_relative 'calrecycling/controller'
require_relative 'calrecycling/version'
require_relative 'calrecycling/year'

module CalRecycling
  def self.similar year, other_years
    year = self::Year.new(year) unless year.kind_of? self::Year
    other_years.select do |other_year|
      other_year = self::Year.new(other_year) unless other_year.kind_of? self::Year

      year != other_year and year.first_day == other_year.first_day and year.days == other_year.days and year.easter == other_year.easter
    end
  end
end