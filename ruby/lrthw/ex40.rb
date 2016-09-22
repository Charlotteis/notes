# The Song class
class Song
  def initialize(lyrics)
    @lyrics = lyrics
  end

  def sing_me_a_songs
    @lyrics.each { |line| puts line }
  end
end

happy_bday = Song.new(['Happy Birthday to you',
                       'I do not want to get sued',
                       'So I will stop right there'])

bulls_on_parade = Song.new(['They rally around tha family',
                            'With pockets full of shells'])

happy_bday.sing_me_a_song
bulls_on_parade.sing_me_a_song
