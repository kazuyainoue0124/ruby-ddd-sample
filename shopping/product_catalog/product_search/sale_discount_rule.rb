# セールの割引価格を計算するビジネスルール
class Shopping::ProductCatalog::ProductSearch::SaleDiscountRule
  def initialize(sale_infos)
    # sale_info[:percentage]があるならPercentageDiscountRule
    # なければFixedAmountDiscountRuleを生成
    # のインスタンスを生成して@sale_listに入れる
    @sale_list = sale_infos.map do |sale_info|
      if sale_info[:percentage].present?
        Shopping::ProductCatalog::ProductSearch::PercentageDiscountRule.new(sale_info[:percentage])
      end

      Shopping::ProductCatalog::ProductSearch::FixedAmountDiscountRule.new(
        sale_info[:target_price],
        sale_info[:fixed_amount]
      )
    end
  end

  # discount_amountメソッドに直接priceを渡していたのをValueObjectを渡す形に変更
  def discounted_price(price)
    price_vo = Shopping::ProductCatalog::ProductSearch::Amount.new(price)
    applicable_sale = @sale_list.max_by do |sale|
      sale.discount_amount(price_vo)
    end

    price_vo - applicable_sale.discount_amount(price_vo)
  end
end
