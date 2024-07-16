# ユーザーがショッピングカートに商品を追加するユースケース
class UserAddProductToShoppingCart
  # user_idはログイン中のユーザーID
  def initialize(user_id)
    @user_id = user_id
  end

  # 引数は商品のIDと個数
  def perform(product_id, count)
    # shopping_cartsテーブルの1行で商品とその個数を保持する
    ShoppingCart.new(user_id: user_id, product_id: product_id, count: count).save!
  end
end
