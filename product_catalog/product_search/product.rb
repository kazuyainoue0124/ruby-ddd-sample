class ProductCatalog::ProductSearch::Product
  attr_reader :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  # getterの代わりにトランケートした文字列を返すメソッドを実装
  def name
    return @name if 30 < @name.length

    @name[0..29] + '...'
  end
end
