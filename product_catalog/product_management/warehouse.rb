# 保管している倉庫
class ProductCatalog::ProductManagement::Warehouse
  attr_reader :warehouse_id

  def initialize(warehouse_id)
    @warehouse_id = warehouse_id
  end
end
