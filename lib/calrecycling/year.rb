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

require 'date'
require 'holidays'

module CalRecycling
  class Year
    include Comparable

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

    def <=> other
      self.to_i <=> other.to_i
    end
  end
end