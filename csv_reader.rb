#!/bin/env ruby
# builds a BBOX based on user input size param (meters) using an input csv file of centroid in format placename,x,y in alaska albers.

require 'csv'

if ARGV.length < 1
  puts "usage: requires input csv file and test scene_id as input parameters."
  exit 1
end

targets = []


file = ARGV[0] # csv dates file
scene_id = ARGV[1] # test scene_id
puts "===>Checking scene_id " + scene_id + " for correct start/end dates from: " + file
sleep 1

csv = CSV.read(file)
csv.each do |row|
  if row[0] == scene_id
    puts row[1] + ", " + row[2]
  end
end


#puts csv.count #[1][0]
#csv.each do |row|
#  puts row[0] + "," + row[1] + "," + row[2]
#  targets.push({ :name => row[0], :x => row[1].to_f, :y => row[2].to_f })
#end


#puts targets.inspect
#targets.each do |t|
#  cmd = "gdal command to clip" #TODO
#end

  
