#!/usr/bin/env ruby
#
#

require "fileutils"
include FileUtils::Verbose


%w{ DSM DTM ORI }.each do |d|
  Dir.glob( d + "/*").each do | t |
    scrap = t.split("_").last
    #puts scrap
    x = "W" + scrap[6..8]
    y = "N" + scrap[1..2]
    degree_block = y + x
    #puts degree_block
    system "mkdir -p " + d + "/IFSAR.SDMI.2012." + d + "_" + degree_block       
    system "mv " + t + " " + d + "/IFSAR.SDMI.2012." + d + "_" + degree_block
  end
end
