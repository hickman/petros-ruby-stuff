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
Dir.glob("all_intermap_orig_geocells/IFSAR.*/*").each do | p |
  #puts p.split('/').last
  n1 = p.split('n').last
  n2 = n1.split('w').first
  n = n2[0] + n2[1]
  w1 = p.split('w').last
  w = w1[0] + w1[1] + w1[2]
  degree_block = 'N' + n + 'W' + w 
  puts degree_block

  x1 = p.split('.').last
#  puts x1
  x2 = x1.split('_').first
#  puts x2
  x3 = x1.split('_').last
#  puts x3

#  %w{ DSM DTM ORI }.each do |d|
#    Dir.glob("#{d}/*INTERMAP*").each do | t |
#      if (degree_block == t.split('_').last) && (x2 == d)
#        system "cp -rlv " + p + " " + t + "/orig_geocells/"
#      end
#    end


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
