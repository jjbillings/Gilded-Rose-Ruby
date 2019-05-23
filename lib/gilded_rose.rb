module GildedRose
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

  class ConjuredManaCake < Item
    def tick
      @days_remaining -= 1
      return if @quality <= 0
      @quality -= 2 if @days_remaining < 0
      @quality -= 2
    end
  end

  CLASS_MAP = {
    "Normal Item" => Normal,
    "Aged Brie" => AgedBrie,
    "Backstage passes to a TAFKAL80ETC concert" => Backstage,
    "Sulfuras, Hand of Ragnaros" => Item,
    "Conjured Mana Cake" => ConjuredManaCake
  }

  def self.for(name:, days_remaining:, quality:)
    CLASS_MAP[name].new(days_remaining: days_remaining, quality: quality)
  end
end
