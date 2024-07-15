# 以下の関連のテーブルがあるとする
# products ||--o{ product_warehouses }o--|| warehouses
# このクラスの中で呼んでいる Product.new は
# ActiveRecord の Product クラスをインスタンス化している
class ProductCatalog::ProductManagement::ProductRepository
  # 引数はProduct Aggregate
  def save(product)
    ar_product = Product.new(name: product.name, price: product.price)
    product.warehouses.each do |warehouse|
      ar_product.product_warehouses.build(warehouse_id: warehouse.warehouse_id)
    end
    ar_product.save!
  end
end
