# Implementing the 99Bottles problem
class Bottles
  def verse(num)
    return make_zero if num.zero?
    return make_one if num == 1

    make_verse(num)
  end

  def verses(from, to)
    song = []
    from.downto(to) do |verse|
      song << make_verse(verse)
    end

    song.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def make_verse(num)
    word = 'bottles'
    word = 'bottle' if (num - 1) == 1

    verse = <<~VERSE
      #{num} bottles of beer on the wall, #{num} bottles of beer.
      Take one down and pass it around, #{num - 1} #{word} of beer on the wall.
    VERSE
    verse = make_zero if num.zero?
    verse = make_one if num == 1
    verse
  end

  def make_zero
    <<~ZERO
      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
    ZERO
  end

  def make_one
    <<~ONE
      1 bottle of beer on the wall, 1 bottle of beer.
      Take it down and pass it around, no more bottles of beer on the wall.
    ONE
  end
end
