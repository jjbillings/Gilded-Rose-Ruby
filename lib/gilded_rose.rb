class Item
  attr_reader :days_remaining, :quality
  def initialize(days_remaining: days_remaining, quality: quality)
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
  end
end

class Normal < Item
  def tick
    @days_remaining -= 1
    return if @quality <= 0

    @quality -= 1
    @quality -= 1 if @days_remaining < 0
  end
end

class AgedBrie < Item
  def tick
    @days_remaining -= 1
    return if @quality == 50

    @quality += 1
    return if @quality == 50
    @quality += 1 if @days_remaining < 0
  end
end

class Backstage < Item
  def tick
    @days_remaining -= 1
    return if @quality == 50
    return @quality = 0 if @days_remaining < 0

    @quality += 1 if @days_remaining < 10
    @quality += 1 if @days_remaining < 5
    @quality += 1
  end
end

class ItemFactory
  def self.get_item(name:, days_remaining:, quality: )
    mapper = {
      "Normal Item" => Normal,
      "Aged Brie" => AgedBrie,
      "Backstage passes to a TAFKAL80ETC concert" => Backstage,
      "Sulfuras, Hand of Ragnaros" => Item,
      "Conjured Mana" => Item
    }

    mapper[name].new(days_remaining: days_remaining, quality: quality)
  end
end

class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    @item = ItemFactory.get_item(name: @name, days_remaining: @days_remaining, quality: @quality)
    @item.tick

    @days_remaining = @item.days_remaining
    @quality = @item.quality
  end
end
