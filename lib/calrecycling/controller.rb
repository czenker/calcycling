require 'erb'

module CalRecycling
  class Controller

    def initialize years
      @years = years
      @this_year = Date.today.year
    end

    def indexAction
      render("index")
    end

    def showAction year
      @year = CalRecycling::Year.new(year)
      max_year = [year, @this_year].max
      @previous_use = CalRecycling.similar(year, (max_year - 500)..(max_year)).last
      @next_use = CalRecycling.similar(year, (max_year)..(max_year + 500)).first

      @other_years = CalRecycling.similar(year, (year - 200)..(year + 200))
      render("show")
    end

    private

    def render(action)
      template = File.read("#{File.dirname(__FILE__)}/templates/#{action}.erb")
      renderer = ERB.new(template)
      renderer.result(binding)
    end

    def link_year(year)
      if @years === year
        "<a href=\"#{year.to_i}.html\">#{year.to_i}</a>"
      else
        year.to_i
      end
    end
  end
end