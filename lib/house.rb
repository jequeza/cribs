class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
  end

  def add_room(room_obj)
    @rooms << room_obj
  end

  def above_market_average?
    @price > 500000
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    @rooms.sum do |room|
      room.area
    end
  end

  def details
    house_details = Hash.new
    house_details["price"] = @price
    house_details["address"] = @address
    house_details
  end

  def price_per_square_foot
    (@price / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by! do |room|
      -room.area
    end
  end

  def rooms_by_category
    categorized_rooms = Hash.new(0)
    @rooms.each do |room|
      categorized_rooms[room.category] = rooms_from_category(room.category)
    end
    categorized_rooms
  end
end