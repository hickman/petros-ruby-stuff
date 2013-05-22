#!/usr/bin/env ruby
#
#

require "fileutils"
include FileUtils::Verbose

#parent_dir = []
#parent_dir = "AK_SDMI_IFSAR_Data_2010/Intermap_Data/"
#cd parent_dir
#Dir.entries(".").each do |cells|

t = ["DSM", "DTM", "ORI"]
t.each do |n|
  Dir.glob('AK_SDMI_IFSAR_Data_2010/Intermap_Data/*').each do |i|
    cell = i.split('/').last
    #cd i #cell + " - " + n.to_s
    Dir.chdir(i) do 
      #build the new scrap_id and path for mkdir
      Dir.glob("USGS_15/*").each do |tile| #{ |scrap| puts "\t" + scrap }
        unless tile.include?(".")
          path = "/san/ifsar/SDMI.IFSAR.2010.merged/buckets/all_intermap_orig_geocells/IFSAR.SDMI.AK.2010.#{cell}/IFSAR.SDMI.AK.2010.#{n}_#{tile.split('/').last}"   
          system "mkdir -p " + path #tile.split('/').last
          #cp tiles to new scrap directories
          Dir.glob("#{tile}/#{n}*.tif").each do |scrap| #{ |scrap| puts "\t" + scrap }          
            system "cp -lv #{scrap} " + path                                                       
          end 
        end
      end
    end
  end
  #cd "../../.."
end


#Dir.glob('**/USGS_15*/*/DSM*.tif') { |i| puts File.dirname(i).split('/').last } - Will's code 
