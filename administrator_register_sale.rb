# 管理者がセールを登録するユースケース
class AdministratorRegisterSale
  def perform(from, to, percentage: nil, target_price: nil, fixed_amount: nil)
    sale = ProductCatalog::SaleManagement::Sale.new(
      from: from,
      to: to,
      percentage: percentage,
      target_price: target_price,
      fixed_amount: fixed_amount
    )
    return false if !sale.valid?

    repository = ProductCatalog::SaleManagement::SaleRepository.new

    result = false

    ActiveRecord::Base.transaction do
      repository.save(sale)
      result = true
    end

    result
  end
end
