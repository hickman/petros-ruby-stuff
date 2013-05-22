#!/bin/env ruby

require 'csv'
require 'yaml'

def boom(msg=nil)
	puts "BOOM: #{msg}" if msg
	puts "usage: requires input target directory as a parameter."
	exit 1
end

## get target directory
tgtdir = ARGV.shift || boom("give me a target dir to work with")
boom("tagger file does not exist: #{tgtdir}") unless File.directory? tgtdir
puts "Updating and writing tagger.new.yml for: " + tgtdir

## load tagger.yml
y = YAML.load_file(File.join(tgtdir,'tagger.yml'))
#puts "old scene_id: " + y['data']['scene_id']

## scene_id
scene_id = File.basename(tgtdir)
#puts "new scene_id: " + scene_id
y['data']['scene_id']= scene_id # update the tagger with correct scene_id 

## scene_group 
a = scene_id.split(".")
scene_group_id = a[0] + "." + a[1]
#puts "scene_group_id: " + scene_group_id
y['data']['scene_group_id']= scene_group_id # update the tagger with correct scene_group_id

## image_metadata_files
n = Dir.entries(tgtdir).collect{|f| File.basename(f)} 
n.delete(".")
n.delete("..")
y['data']['image_metadata_files'] = n
#z = y['data']['image_metadata_files'].map { |x| x + "/" }
#y['data']['image_metadata_files'] = z

## short_desc
blurb = y['data']['short_desc']
r = blurb.split(" ")
tr = r[2].to_f
sr = y['data']['resolution'][0].to_f
hr = sprintf("%.1f",sr) + "m"
r.delete("0.6m")
nblurb = r.insert(2, hr).join(" ")

## get old start_time
st = y['data']['start_time']
sd = st.split(" ")
sdate = sd[0]

## get old end_time
et = y['data']['end_time']
ed = st.split(" ")
edate = ed[0]

## query Profile_Imagery_dates.csv for correct dates
csv = CSV.read("Profile_Imagery_dates.csv") 
csv.each do |row|
  if row[0] == scene_id
    y['data']['start_time'] = row[1] + " 00:00:00" # update start_time
    y['data']['end_time'] = row[2] + " 23:59:59"
  end
end

## bounds
if y['data']['bounds'] == 'full_box'
    puts "fixing #{tgtdir}"
    y['data']['bounds'] = 'fullbox'
end

## write new y to tagger.yml
File.open(File.join(tgtdir,'tagger.new.yml'),'w') { |f| f << y.to_yaml }
