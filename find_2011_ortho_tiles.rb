#!/usr/bin/env ruby
#
#reads txt file of gdalbuildvrt error msgs to parse out bad ori tilenames
#

require "fileutils"
include FileUtils::Verbose


infile = File.open("2011-ortho-list.txt", "r")
#hitfile = File.new("2011-ortho-CM1_20120315-hits.txt", "w")
missfile = File.new("2011-ortho-CM1_20120315-missed.txt", "w")

incount = 0
outcount = 0

infile.each do |row|
  incount += 1
  tgt_tile = row.split(" ").last 
  puts tgt_tile
  %w{ CIR PAN RGB }.each do |d|
    Dir.glob(d + "/*.tif").each do |tgt_file|
      if tgt_file[4..12] == tgt_tile
        #hitfile.write tgt_file + "\n"
        puts "cp " + tgt_file + " /run/media/pete/60D013C9D013A476/SPOT5.SDMI.ORTHO.2011/"
        outcount += 1
      end
    end
  end
end
puts incount
puts outcount / 3
#  gotone = badlines[2].split("/").first
#  if gotone == "ORI"
#    badtiles = badlines[2]
#    puts badtiles
#    outfile.write badtiles + "\n"
#  end    

#  badlines = row.split(" ").last
#  throwout = badlines.split("/").first
#  if throwout == "ORI"
#    badtiles = badlines
#    outfile.write badtiles + "\n"
#  end
