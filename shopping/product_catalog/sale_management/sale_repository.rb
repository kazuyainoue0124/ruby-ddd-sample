class Shopping::ProductCatalog::SaleManagement::SaleRepository
  # 引数は Shopping::ProductCatalog::SaleManagement::Sale のインスタンス
  # percentage_discount&.percentage などの&.は
  # percentage_discountがnilだった場合に
  # percentageメソッドを呼び出さずにnilを返すメソッド呼び出し方法
  def save(sale)
    percentage_discount = sale.percentage_discount
    fixed_amount_discount = sale.fixed_amount_discount
    sale = Sale.new(
      from: sale.from,
      to: sale.to,
      percentage: percentage_discount&.percentage,
      target_price: fixed_amount_discount&.target_price,
      fixed_amount: fixed_amount_discount&.fixed_amount
    )
    sale.save!
  end
end

