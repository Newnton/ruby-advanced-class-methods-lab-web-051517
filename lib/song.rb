require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  def initialize name = nil, artist_name = nil
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name name
    self.new(name)
  end

  def self.create_by_name name
    new_name = self.new(name)
    @@all << new_name
    new_name
  end

  def save
    self.class.all << self
  end

  def self.find_by_name name
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
  end
  def self.destroy_all
    self.all.clear
  end
  def self.find_or_create_by_name name
    if find_by_name name == nil
      Song.new(name)
    else
      return find_by_name name
    end
  end
  def self.alphabetical
    @@all.sort do |a, b|
      a.name <=> b.name
    end
  end
  def self.new_from_filename filename
    split_filename = filename.split" - "
    artist_name = split_filename[0]
    name = split_filename[1].chomp('.mp3')
    Song.new name, artist_name
  end
  def self.create_from_filename filename
    split_filename = filename.split" - "
    artist_name = split_filename[0]
    name = split_filename[1].chomp('.mp3')
    (Song.new name, artist_name).save
  end
end
