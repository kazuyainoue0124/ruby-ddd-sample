# 固定額値引
class Shopping::ProductCatalog::SaleManagement::FixedAmountDiscount
  attr_reader :target_price, :fixed_amount

  def initialize(target_price, fixed_amount)
    @target_price = target_price
    @fixed_amount = fixed_amount
  end


  def valid?
    return false if @target_price <= @fixed_amount

    true
  end
end
