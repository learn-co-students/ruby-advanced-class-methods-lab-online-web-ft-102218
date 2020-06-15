require 'pry'

class Song
  attr_accessor :name, :artist_name


  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
    #binding.pry
  end

  def self.find_by_name(name)
    self.all.find{ |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name)
      song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by(&:name)
  end

  def self.new_from_filename(filename)
    file_array = filename.split(" - ")
    name = file_array[1].split(".").first
    artist_name = file_array[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all = []
  end

end
