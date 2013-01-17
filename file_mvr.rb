#!/usr/bin/env ruby
#
#reads through the directory to find scrap id and mkdir scrapdir and mv all 
#filed including scrap id to the correct scrapdir

require "fileutils"
include FileUtils::Verbose

count = 0

d = Dir.new(".")
d.each do |name|
  if File.file?(name)
    filename = name
    if File.extname(filename) == ".txt"
      tile_id = File.basename(filename,".*")
      if tile_id.include? "bgrn"
        prefix = "IKONOS.NPS.LACL.2006."
        tidbits = tile_id.split("_")
        scrap = tidbits[0] + "_" + tidbits[1] + "_" + tidbits[3]
        scrapdir = prefix + scrap
        targets = Dir.glob("*_" + tidbits[1] + "*_" + tidbits[3] + "*.*")
        count = count + 1
#       puts "making directory: " + scrapdir
        puts "moving file: " + targets.join("\n")
        puts "to directory: " + scrapdir
        puts "--- " + count.to_s 
#       mkdir scrapdir unless File.directory? scrapdir
        mv(targets, scrapdir)
      end
      #for filename in *tile_id*.*
      #  puts filename
    end
  end
end

puts "number of files moved = " + count.to_s
