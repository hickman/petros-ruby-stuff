#!/usr/bin/env ruby
# builds a BBOX based on user input size param (meters) using an input csv file of centroid in format placename,x,y in alaska albers.

require 'csv'

if ARGV.length < 1
  puts "usage: requires input csv file as a parameter."
  exit 1
end

sum = 0


file = ARGV[0] # csv dates file
expense = ARGV[1] # test scene_id
puts "===> Calculating sum for " + expense + " from " + file
sleep 1

csv = CSV.read(file)
csv.each do |row|
  tgt = row[5].split("*").first

  if tgt == expense
    puts row[4] + " " + tgt + " = " + row[2]
    sum += row[2].to_f
  end
end

puts sum


#puts csv.count #[1][0]
#csv.each do |row|
#  puts row[0] + "," + row[1] + "," + row[2]
#  targets.push({ :name => row[0], :x => row[1].to_f, :y => row[2].to_f })
#end


#puts targets.inspect
#targets.each do |t|
#  cmd = "gdal command to clip" #TODO
#end

  
