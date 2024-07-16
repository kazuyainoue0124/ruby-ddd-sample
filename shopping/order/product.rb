# 商品
class Shopping::Order::Product
  attr_reader :name, :price

  def initialize(name, price, count, sale_discount_rule)
    @name = name
    @price = price
    @count = count
    @sale_discount_rule = sale_discount_rule
  end

  def discounted_price
    @sale_discount_rule.discounted_price(@price)
  end

  def subtotal
    @price * @count
  end

  def discounted_subtotal
    discounted_price * @count
  end
end
