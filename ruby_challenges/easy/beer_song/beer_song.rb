class BeerSong
  def verse(bottles)
    case bottles
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" \
      "Take one down and pass it around, #{bottles - 1} bottles of beer on the wall.\n"
    end
  end

  def verses(end_bottle, start_bottle)
    string = ""

    end_bottle.downto(start_bottle).each do |bottles|
      string << verse(bottles) << "\n"
    end

    string.chomp
  end

  def lyrics
    verses(99, 0)
  end
end

# song = BeerSong.new
# song.verses(2, 0)