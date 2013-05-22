#!/usr/bin/env ruby

#reads through the directory to find scrap id and mkdir scrapdir and mv all 
#filed including scrap id to the correct scrapdir

require "fileutils"
include FileUtils::Verbose

count = 0
failed = 0

stats = { :count => 0, :failed => 0 }

Dir.glob("Cell*/USGS*/*/*.html").each do |t|
  m = File.basename(t)
  a = m.split("_").first
  n = m[4..6]
  if n[0] == "n"
    n = "N" + m[5..6]
  end
  w = m[9..12]
  if w[0] == "w"
    w = "W" + m[10..12]
  end
  geocell = a + "_" + n + w
  cell = File.basename(m, ".*")[4..-1]
  cell = File.basename(cell, "_*") if cell.include? "sup"
  puts "copying " + t 
  scrap = Dir.glob("/san/ifsar/SDMI.IFSAR.2010.merged_extras/" + a + "/*INT*" + geocell).first 
  tgtdir = Dir.glob(scrap + "/orig_geocells/*" + cell).first + "/"
  if tgtdir == nil
    puts "SUPER MEGA FAIL: " + scrap
    puts cell
    exit
  end
  if File.directory?(tgtdir) 
    puts "to target " + tgtdir 
    system "cp " + t + " " + tgtdir
    stats[:count] += 1 
  else
    puts "FAIL: " + tgtdir
    stats[:failed] += 1
  end
end

puts stats.inspect
