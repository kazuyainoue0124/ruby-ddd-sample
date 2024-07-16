# セール Aggregateルート
class Shopping::ProductCatalog::SaleManagement::Sale
  attr_reader :from, :to, :percentage_discount, :fixed_amount_discount

  # パーセント割引も固定額値引も指定されていないケースを考慮していないが
  # ハンズオンなので省略
  def initialize(from, to, percentage: nil, target_price: nil, fixed_amount: nil)
    @from = from
    @to = to
    if percentage.present?
      @percentage_discount = 
        Shopping::ProductCatalog::SaleManagement::PercentageDiscount.new(percentage)
      return
    end

    @fixed_amount_discount = 
      Shopping::ProductCatalog::SaleManagement::FixedAmountDiscount.new(target_price, fixed_amount)
  end

  def valid?
    return @percentage_discount.valid? if @percentage_discount.present?

    @fixed_amount_discount.valid?
  end
end
