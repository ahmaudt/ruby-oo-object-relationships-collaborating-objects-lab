require 'pry'
require_relative './mp3_importer.rb'


class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        # binding.pry
        track_name_split = file.split(" - ")
        new_track = self.new(track_name_split[1])
        new_artist = Artist.find_or_create_by_name(track_name_split[0])
        new_track.artist = new_artist
        new_artist.add_song(new_track)
        new_track
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end