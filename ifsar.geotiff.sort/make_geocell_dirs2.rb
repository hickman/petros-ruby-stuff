#!/usr/bin/env ruby
#
#

require "fileutils"
include FileUtils::Verbose

#Dir.entries("all_intermap_orig_geocells").each do |f|
#  puts f
#end

# put each subdir into d
#
Dir.glob("all_R201210_orig_geocells/IFSAR.*/*").each do | p |
  tile_id = p.split('.').last
#  puts tile_id
  type = tile_id.split('_').first
#  puts type
#  if tile_id[0] == 'n'
#    n1 = p.split('n').last
#    puts "n1 = " + n1
#    n2 = n1.split('w').first
#    puts "n2 = " + n2
#    n = n2[0] + n2[1]
#    puts "n = " + n
#    w1 = p.split('w').last
#    puts "w1 = " + w1
#    w = w1[0] + w1[1] + w1[2]
#    puts "w = " + w
#    degree_block = 'N' + n + 'W' + w 
#     puts "degree_block = " + degree_block
#  elsif tile_id[0] == 'N'
    n1 = p.split('N').last
#    puts "n1 = " + n1
    n2 = n1.split('W').first
#    puts "n2 = " + n2
    n = n2[0] + n2[1]
#    puts "n = " + n
    w1 = p.split('W').last
#    puts "w1 = " + w1
    w = w1[0] + w1[1] + w1[2]
#    puts "w = " + w
    degree_block = 'N' + n + 'W' + w
#    puts "degree_block = " + degree_block
#  end    

    geocelldir = 'IFSAR.SDMI.2010.FUGRO.' + type + '_' + degree_block
#    puts geocelldir

  x1 = p.split('.').last
#  puts x1
  x2 = x1.split('_').first
#  puts x2
#  x3 = x1.split('_').last
#  puts x3

  %w{ DSM DTM ORI }.each do |d|
#    Dir.glob( d + "/*EDGEMATCHED*").each do | t |
#      puts "t = " + t
#      if (degree_block == t.split('_').last) && (x2 == d)
#        system "cp -rlv " + p + " " + t + "/orig_geocells/"
       directory = type + "/" + geocelldir
       if type == d and !File.exists?(directory) 
         system "mkdir -p " + directory + "/orig_geocells" 
       end
  end


#    cd d
#    newdir = "mkdir IFSAR.SDMI.2010.INTERMAP.#{d}_#{degree_block}"
#    system "mkdir " + newdir unless File.directory? newdir
#    cd ".."
  #  puts pwd
  #  Dir.entries(".").each do |t|
  #   puts t
      #o = File.join(t, "orig_geocells")
      #if File.exists? o
      #  puts "\t#{o} exists" if File.exists? o
      #else
      #  puts "\t mkdir #{o}"
      #end    
  #  end
  #  puts pwd
#  end
end
