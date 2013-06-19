#!/usr/bin/env ruby
#
#cp this rb and the *list.txt file to:
#/san/sdmi_source/SDMI.ORTHO/SDMI.ORTHO.2011 


require "fileutils"
include FileUtils::Verbose


infile = File.open("2011-ortho-list.txt", "r")
#hitfile = File.new("2011-ortho-CM1_20120315-hits.txt", "w")
#missfile = File.new("2011-ortho-CM1_20120315-missed.txt", "w")

incount = 0
outcount = 0

infile.each do |row|
  incount += 1
  tgt_tile = row.split(" ").last 
  puts tgt_tile
  Dir.glob("*") do |tgt_scrap|
    if tgt_scrap.split(".").last == tgt_tile
      #hitfile.write tgt_file + "\n"
      system "rsync -av --progress " + tgt_scrap + " /run/media/pete/60D013C9D013A476/SPOT5.SDMI.ORTHO.2011/"
      outcount += 1
    end
  end
end
puts incount
puts outcount
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
