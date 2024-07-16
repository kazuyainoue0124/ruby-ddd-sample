class Shopping::ProductCatalog::ProductSearch::Amount
  include Comparable # 比較演算子のために必要

  def initialize(value)
    # to_rは数値を有理数に変換するメソッド
    # 有理数で計算することで無限精度が得られる
    @value = value.to_r
  end

  # Rubyでは四則演算メソッドを定義できる
  def +(other)
    # self.classは自身のクラスつまりProductCatalog::ProductSearch::Amountのことで
    # インスタンスメソッドの中で新しいインスタンスを作成する
    self.class.new(@value + other.to_r)
  end

  def -(other)
    self.class.new(@value - other.to_r)
  end

  def *(other)
    self.class.new(@value * other.to_r)
  end

  def /(other)
    self.class.new(@value / other.to_r)
  end

  # 比較演算子のために必要
  def <=>(other)
    @value <=> other
  end

  def print_value
    # 整数にすることで小数点以下を切り捨てる
    @value.to_i
  end
end
