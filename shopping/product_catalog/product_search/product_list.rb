# 商品一覧
class Shopping::ProductCatalog::ProductSearch::ProductList
  attr_reader :products

  # 引数のproductsは以下のような配列
  # [{ name: '商品名A', price: 10000 }, { name: '商品名B', price: 20000 }, ...]
  # 引数のsale_infosは以下のような配列
  # [ { percentage: 10, target_price: nil, fixed_amount: nil },
  #   { percentage: nil, target_price: 5000, fixed_amount: 500 },
  #   ... ]
  def initialize(products, sales_infos)
    # SaleDiscountRuleをインスタンス化
    sale_discount_rule = Shopping::ProductCatalog::ProductSearch::SaleDiscountRule.new(sales_infos)

    # 引数の配列の要素を1つずつ取り出してProductインスタンスの配列を作る
    @products = products.map do |product|
      Shopping::ProductCatalog::ProductSearch::Product.new(product[:name], product[:price], sale_discount_rule)
    end
  end
end
