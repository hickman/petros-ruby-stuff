#!/usr/bin/env ruby
#
#reads txt file of gdalbuildvrt error msgs to parse out bad ori tilenames
#

require "fileutils"
include FileUtils::Verbose


infile = File.open( "bad_ori_tiles.txt", "r" )
outfile = File.new("dif_color_tables.txt", "w")

infile.each do |row|
  badlines = row.split(" ")
  gotone = badlines[2].split("/").first
  if gotone == "ORI"
    badtiles = badlines[2]
    puts badtiles
    outfile.write badtiles + "\n"
  end    
end

#  badlines = row.split(" ").last
#  throwout = badlines.split("/").first
#  if throwout == "ORI"
#    badtiles = badlines
#    outfile.write badtiles + "\n"
#  end
