# 管理者が商品を登録するユースケース
class AdministratorRegisterProduct
  def perform(name, price, warehouse_ids)
    product = ProductCatalog::ProductManagement::Product.new(
                name, price, warehouse_ids
              )
    return false if !product.valid?

    repository = ProductCatalog::ProductManagement::ProductRepository.new
    result = false
    
    ActiveRecord::Base.transaction do
      repository.save(product)

      result = true
    end

    result
  end
end

