class Order
  attr_reader :order_number
  attr_accessor :bowl, :table, :hookah, :tobacco

  def initialize(order_number)
    @order_number = order_number
    @bowl = []
    @table = []
    @hookah = []
    @tobacco = []
  end
end