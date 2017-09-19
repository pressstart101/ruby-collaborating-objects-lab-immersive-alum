# require 'pry'

# # ["Action Bronson - Larry Csonka - indie.mp3",
# #  "Real Estate - Green Aisles - country.mp3",
# #  "Thundercat - For Love I Come - dance.mp3",
# #  "Real Estate - It's Real - hip-hop.mp3"]

class MP3Importer
  attr_accessor :path
  def initialize(path)
    @path = path
  end


    def files
      files = Dir.glob(File.join(path, "*"))
      new_file = []
      files.each do |file|
        new_file << file.gsub("./spec/fixtures/mp3s/", "")
      end
      new_file
    end

      #   Dir.glob(path+"**/*.mp3").map {|file| file.split("/")[4]}
      # @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }

  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end

end
