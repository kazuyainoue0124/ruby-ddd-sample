# 商品 Aggregateルート
class ProductCatalog::ProductManagement::Product
  attr_reader :name, :price, :warehouses

  def initialize(name, price, warehouse_ids)
    @name = name
    @price = price
    # 倉庫IDの配列の要素を1つずつ取り出してWarehouseインスタンスの配列を作る
    @warehouses = warehouse_ids.map do |warehouse_id|
      ProductCatalog::ProductManagement::Warehouse.new(warehouse_id)
    end
  end

  def valid?
    return false if 100 < name.length

    true
  end
end
