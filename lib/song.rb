
class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    arr = filename.split(" - ")
    song_name = arr[1]
    artist_name = arr[0]
    song = self.new(song_name)
    song.artist_name(artist_name)
    song
  end

  def artist_name(name)
    artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
    artist.save
    self.artist = artist
  end

end
