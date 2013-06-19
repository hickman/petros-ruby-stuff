#!/usr/bin/env ruby
#
#gdal_translate tiles listed in heterogenous_bands.txt
#

require "fileutils"
include FileUtils::Verbose


flist1 = []
flist2 = []
fcount1 = 0
fcount2 = 0



infile1 = File.open("bad_intermap.txt", "r")
infile1.each do |row|
  flist1.push(File.basename(row, '.*'))
  fcount1 += 1
end
puts flist1
puts fcount1

puts " "

infile2 = File.open("gina-ORI.txt", "r")
infile2.each do |row|
  flist2.push(File.basename(row, '.*')[5..-1])
  fcount2 += 1
end
puts flist2
puts fcount2

puts flist1.sort == flist2.sort
fout = flist1.sort - flist2.sort
puts fout





