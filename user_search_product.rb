# ユーザーが商品を検索する
class UserSearchProduct
  def perform(name: '', from_price: nil, to_price: nil, page: nil)
    ProductCatalog::ProductSearch::ProductListRepository.new.search(
      name: name, from_price: from_price, to_price: to_price, page: page
    )
  end
end
