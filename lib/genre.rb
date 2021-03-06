

class Genre
  extend Concerns::Findable
  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end 

  def add_song(song)
     song.genre = self unless song.genre == self
     @songs << song unless @songs.include?(song)
  end

  def artist
    @songs.each do |song|
      puts artist
    end
  end

  def artists
    @songs.collect{|song| song.artist}.uniq
  end


  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end 
end