#!/usr/bin/env ruby
#
#

require "fileutils"
include FileUtils::Verbose

parent_dir = []
parent_dir = "AK_SDMI_IFSAR_Data_2010/Intermap_Data/"
cd parent_dir
Dir.entries(".").each do |cells|
  puts cells
  puts pwd
  if cells == "."
    puts "got" + cells
  elsif cells == ".."
    puts "got" + cells
  else
    target_dir = cells + "/USGS_15/"
    cd target_dir
    Dir.entries(".").each do |scrap|
      puts "\t#{scrap}"
      puts pwd
    end
    cd "../../"
    puts pwd
  end 
end

# put each subdir into d
#%w{ DSM DTM ORI }.each do |d|
#  puts d
#  cd d
#  Dir.entries(".").each do |t|
#    puts t
     #o = File.join(t, "orig_geocells")
     #if File.exists? o
     #  puts "\t#{o} exists" if File.exists? o
     #else
     #  puts "\t mkdir #{o}"
     #end    
#  end
#  cd ".."
#end
