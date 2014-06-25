#!/usr/bin/env ruby
#
#cp this rb and the *list.txt file to:
#/san/sdmi_source/SDMI.ORTHO/SDMI.ORTHO.2011 


require "fileutils"
include FileUtils::Verbose


infile = File.open("tile_request.txt", "r")
#hitfile = File.new("2011-ortho-CM1_20120315-hits.txt", "w")
#missfile = File.new("2011-ortho-CM1_20120315-missed.txt", "w")

incount = 0
outcount = 0

infile.each do |row|
#  tgt_tile = row.split(" ").last 
  if row != ""
    puts row
    incount += 1
  end
  %w{ 2010 2011 2012 }.each do |d|
#    puts "auto/glusterfs/gvolsdmiortho/SDMI.ORTHO." + d
    Dir.glob("/auto/glusterfs/gvolsdmiortho/SDMI.ORTHO." + d + "/*") do |tgt_scrap|
#      puts tgt_scrap.split(".").last
      if tgt_scrap.split(".").last == row.chomp
      #hitfile.write tgt_file + "\n"
        system "rsync -av --progress " + tgt_scrap + " ."
        outcount += 1
      end
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
