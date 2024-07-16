# パーセント割引の計算をするビジネスルール
class ProductCatalog::ProductSearch::PercentageDiscountRule
  def initialize(percentage)
    @percentage = percentage
  end

  def discount_amount(price)
    price * @percentage / 100
  end
end
