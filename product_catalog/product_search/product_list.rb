class ProductCatalog::ProductSearch::ProductList
  attr_reader :products

  # 引数のproductsは以下のような配列
  # [{ name: '商品名A', price: 10000 }, { name: '商品名B', price: 20000 }, ...]
  def initialize(products)
    # 引数の配列の要素を1つずつ取り出してProductインスタンスの配列を作る
    @products = products.map do |product|
      ProductCatalog::ProductSearch::Product.new(product[:name], product[:price])
    end
  end
end
