class ProductCatalog::ProductSearch::ProductListRepository
  def search(name: '', from_price: nil, to_price: nil, page: nil)
    products = Product.all
    products = products.where('name LIKE ?', "%#{name}%") if name.present?
    products = products.where('? <= price', from_price) if from_price.present?
    products = products.where('price <= ?', to_price) if to_price.present?
    products = products.page(page).per(20) if page.present?
    
    # ActiveRecordの配列から以下の形式のhashの配列に変換
    # [{ name: '商品名A', price: 10000 }, { name: '商品名B', price: 20000 }, ...]
    product_hash_list = products.select(:id, :name)
                                .map(&:attributes)
                                .map(&:symbolize_keys)

    ProductCatalog::ProductSearch::ProductList.new(product_hash_list)
  end
end

