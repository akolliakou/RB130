class CircularBuffer
  def initialize(size)
    @array = Array.new
    @array_size = size
  end

  def read
    raise BufferEmptyException if @array.empty?
    @array.delete_at(0)
  end

  def write(el)
    return if !el
    raise BufferFullException if @array.size == @array_size
    @array.push(el)
  end

  def write!(el)
    return if !el
    if @array.size == @array_size
      @array.delete_at(0)
      @array.push(el)
    else
      @array.push(el)
    end
  end

  def clear
    @array = []
  end

class BufferEmptyException < Exception; end
class BufferFullException < Exception; end
end