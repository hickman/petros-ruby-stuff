#!/usr/bin/env ruby
#
#gdal_translate tiles listed in heterogenous_bands.txt
#

require "fileutils"
include FileUtils::Verbose


infile = File.open( "dif_color_tables.txt", "r" )
outsize = 0

infile.each do |row|
  row = row.chomp
  
#  outsize += File.size(row).to_i

  dirs = row.split('/')
  outpath = dirs[0..3].join('/') + "/"
  outfile = "gina-" + dirs[4]
#  puts outpath + outfile

#  system "rm " + outpath + outfile

#  system "gdalwarp -of GTiff -co TILED=YES -co COMPRESS=LZW -t_srs 'EPSG:3338' " + row + " " + outpath + outfile

  system "gdal_translate -of GTiff -expand gray -co TILED=YES -co COMPRESS=LZW " + row + " " + outpath + outfile
end

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
