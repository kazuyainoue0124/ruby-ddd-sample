# ショッピングカート Aggregateルート
class Shopping::Order::ShoppingCart
  def initialize(product_list, sale_infos)
    sale_discount_rule = 
      Shopping::ProductCatalog::ProductSearch::SaleDiscountRule.new(sale_infos)

    @products = product_list.map do |product|
      Shopping::Order::Product.new(
        product[:name], product[:price], product[:count], sale_discount_rule
      )
    end
  end

  def total_amount
    @products.map(&:discounted_subtotal).sum
  end
end
