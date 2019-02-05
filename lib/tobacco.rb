class Tobacco
  attr_reader :name
  attr_accessor :price, :amount

  def initialize(name, price, amount)
    @name = name
    @price = price
    @amount = amount
  end
end