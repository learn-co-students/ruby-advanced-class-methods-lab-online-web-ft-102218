class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name)
      song
    else self.create_by_name(name)
    end
  end 
  
  def self.new_from_filename(filename)
  file_name_array = filename.split(" - ")
  name = file_name_array[1].split(".").first
  artist_name = file_name_array[0]
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
  
  def self.alphabetical
      @@all.sort_by {|x| x.name}
  end

  def self.destroy_all
    @@all.clear
  end 
end
