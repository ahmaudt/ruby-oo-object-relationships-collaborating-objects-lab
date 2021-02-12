require 'pry'

require_relative './song.rb'
require_relative './mp3_importer.rb'

class Artist
    attr_accessor :name, :songs

    @@all = []


    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end


    def songs
        Song.all.select { |song| song.artist == self }
    end

    def self.find_or_create_by_name(name)
        self.all.detect { |artist| artist.name == name } || Artist.new(name)
    end

    def print_songs
        @@all.each do |artist|
            artist.songs.each do |track|
                puts track.name
            end
        end
    end
end