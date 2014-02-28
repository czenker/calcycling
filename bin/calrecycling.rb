#!/usr/bin/env ruby

require_relative "../lib/calrecycling"

years = 1900..2100
controller = CalRecycling::Controller.new(years)

File.write("index.html", controller.indexAction)
years.each do |year|
  File.write("#{year}.html", controller.showAction(year))
end
