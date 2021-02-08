class Crypto
  def initialize(str)
    @str = str
  end

  def normalize_plaintext
    @str.delete("^a-z", "^A-Z", "^0-9").downcase
  end

  def size
    if perfect_square?
      square_sides
    else
      non_square_sides
    end
  end

  def plaintext_segments
    normalize_plaintext.chars.each_slice(size).to_a.map(&:join)
  end

  def ciphertext
    normalize_ciphertext.split.join
  end

  def normalize_ciphertext
    if plaintext_segments.all? do |segment|
      plaintext_segments[0].size == segment.size
    end
      cipher_square(0)
    else
      cipher_non_square(0)
    end
  end

  private

  def perfect_square?
    (1..normalize_plaintext.size).any? do |int|
      int * int == normalize_plaintext.size
    end
  end

  def square_sides
    (1..normalize_plaintext.size).find do |int|
      int * int == normalize_plaintext.size
    end
  end

  def non_square_sides
    (1..normalize_plaintext.size).find do |int|
      int * int > normalize_plaintext.size
    end
  end

  def cipher_square(counter)
    arr = []

    until counter == size
      new_str = ''
      plaintext_segments.each do |str|
        new_str += str[counter]
      end
      arr << new_str
      counter += 1
    end

    arr.join(" ")
  end

  def equalize_segments
    plaintext_segments.each do |segment|
      until plaintext_segments[0].size == segment.size
        segment << '!'
      end
    end
  end

  def cipher_non_square(counter)
    arr = []

    until counter == size
      new_str = ''
      equalize_segments.each do |str|
        new_str += str[counter]
      end
      arr << new_str
      counter += 1
    end

    arr.each { |segment| segment.delete!("!") }.join(" ")
  end
end
