class Room
  attr_reader :category, :length, :width

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
    @has_paint = false
  end

  def area
    @length * @width.to_i
  end

  def is_painted?
    @has_paint
  end

  def paint
    @has_paint = true
  end
end
