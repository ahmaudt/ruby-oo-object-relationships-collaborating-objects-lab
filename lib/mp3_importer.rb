require_relative './song.rb'
require_relative './artist.rb'

class MP3Importer
    attr_accessor :path

    def initialize(song_path)
        @path = song_path
    end

    def files
        music_files = Dir.entries(@path)
        music_files = music_files.select{ |mp3| mp3 =~ /[mp3]/}
        music_files
    end


    def import
        self.files.each do |track|
            Song.new_by_filename(track)
        end
    end
end