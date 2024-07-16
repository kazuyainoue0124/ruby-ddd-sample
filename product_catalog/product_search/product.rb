class ProductCatalog::ProductSearch::Product
  attr_reader :price

  def initialize(name, price, sale_discount_rule)
    @name = name
    @price = price
    @sale_discount_rule = sale_discount_rule
  end

  # getterの代わりにトランケートした文字列を返すメソッドを実装
  def name
    return @name if 30 < @name.length

    @name[0..29] + '...'
  end

  # 値引き後価格を返せるようにする
  def discounted_price
    @sale_discount_rule.discounted_price(@price)
  end
end
