# The MIT License (MIT)
#
# Copyright (c) 2014 Christian Zenker
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

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