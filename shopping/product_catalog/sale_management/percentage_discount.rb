# パーセント割引
class Shopping::ProductCatalog::SaleManagement::PercentageDiscount
  attr_reader :percentage

  def initialize(percentage)
    @percentage = percentage
  end

  # パーセンテージの指定がされているかというチェックもできるが
  # ハンズオンなので省略
  def valid?
    true
  end
end
