class Normal
  attr_reader :days_remaining, :quality
  def initialize(days_remaining: days_remaining, quality: quality)
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    @days_remaining -= 1
    return if @quality <= 0

    @quality -= 1
    @quality -= 1 if @days_remaining < 0
  end
end

class Normal
  attr_reader :days_remaining, :quality
  def initialize(days_remaining: days_remaining, quality: quality)
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    @days_remaining -= 1
    return if @quality <= 0

    @quality -= 1
    @quality -= 1 if @days_remaining < 0
  end
end

class Normal
  attr_reader :days_remaining, :quality
  def initialize(days_remaining: days_remaining, quality: quality)
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    @days_remaining -= 1
    return if @quality <= 0

    @quality -= 1
    @quality -= 1 if @days_remaining < 0
  end
end

class AgedBrie
  attr_reader :days_remaining, :quality
  def initialize(days_remaining: days_remaining, quality: quality)
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    @days_remaining -= 1
    return if @quality == 50

    @quality += 1
    return if @quality == 50
    @quality += 1 if @days_remaining < 0
  end
end

class Backstage
  attr_reader :days_remaining, :quality
  def initialize(days_remaining: days_remaining, quality: quality)
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    @days_remaining -= 1
    return if @quality == 50
    return @quality = 0 if @days_remaining < 0

    @quality += 1 if @days_remaining < 10
    @quality += 1 if @days_remaining < 5
    @quality += 1
  end
end

class Sulfras
  attr_reader :days_remaining, :quality
  def initialize(days_remaining: days_remaining, quality: quality)
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
  end
end

class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def normal_tick
    normal = Normal.new(days_remaining: @days_remaining, quality: @quality)
    normal.tick

    @days_remaining = normal.days_remaining
    @quality = normal.quality
  end

  def aged_brie_tick
    aged_brie = AgedBrie.new(days_remaining: @days_remaining, quality: @quality)
    aged_brie.tick

    @days_remaining = aged_brie.days_remaining
    @quality = aged_brie.quality
  end

  def backstage_tick
    backstage = Backstage.new(days_remaining: @days_remaining, quality: @quality)
    backstage.tick

    @days_remaining = backstage.days_remaining
    @quality = backstage.quality
  end

  def sulfras_tick
  end

  def tick
    case @name
    when "Normal Item"
      return normal_tick
    when "Aged Brie"
      return aged_brie_tick
    when "Backstage passes to a TAFKAL80ETC concert"
      return backstage_tick
    when "Sulfuras, Hand of Ragnaros"
      return sulfras_tick
    end
  end
end
