#!/usr/bin/env ruby

require_relative "../lib/calrecycling"

years = 1900..2100
controller = CalRecycling::Controller.new

File.write("index.html", controller.indexAction)
