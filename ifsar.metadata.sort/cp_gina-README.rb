#!/usr/bin/env ruby
#
#gdal_translate tiles listed in heterogenous_bands.txt
#

require "fileutils"
include FileUtils::Verbose


infile = File.open( "gina-ORI_tiles.txt", "r" )
count = 0

infile.each do |row|
  row = row.chomp
#  puts "row: " + row
  
#  outsize += File.size(row).to_i

  dirs = row.split('/')
#  puts "dirs: " + dirs.to_s
  outpath = dirs[0..2].join('/') + "/"
  puts "outpath: " + outpath
  count += 1
  cpfile = "gina-ORI-README.txt"
  outfile = dirs[3]
  puts outfile
  system "cp " + cpfile + " " + outpath + File.basename(outfile, ".tif") + ".txt"

#  system "rm " + outpath + outfile

#  system "gdalwarp -of GTiff -co TILED=YES -co COMPRESS=LZW -t_srs 'EPSG:3338' " + row + " " + outpath + outfile

#  system "gdal_translate -of GTiff -expand gray -co TILED=YES -co COMPRESS=LZW " + row + " " + outpath + outfile
end
puts "count = " + count.to_s

#puts "#{outsize * 0.00000000093132} GB"

#  badlines = row.split(" ")
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
