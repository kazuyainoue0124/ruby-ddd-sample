# 固定額値引の計算をするビジネスルール
class Shopping::ProductCatalog::ProductSearch::FixedAmountDiscountRule
  def initialize(target_price, fixed_amount)
    @target_price = target_price
    @fixed_amount = fixed_amount
  end

  def discount_amount(price)
    # 対象価格未満の価格は値引きしない
    return 0 if price < @target_price

    # 値引後価格が0以下になるなら値引後価格が1円になるように値引
    return price - 1 if price <= @fixed_amount

    Shopping::ProductCatalog::ProductSearch::Amount.new(@fixed_price)
  end
end
