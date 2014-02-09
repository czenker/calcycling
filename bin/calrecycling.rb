#!/usr/bin/env ruby

require_relative "../lib/calrecycling"

year = ARGV[0].to_i

puts CalRecycling.similar year, 1900..2200