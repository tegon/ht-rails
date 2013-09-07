class Set
  include Enumerable

  def initialize
    @items = []
  end

  def size
    @items.size
  end

  def empty?
    @items.empty?
  end

  def <<(item)
    @items << item unless @items.include?(item)
  end

  def each(&block)
    @items.each(&block)
  end
end