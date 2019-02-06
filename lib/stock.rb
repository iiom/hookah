class Stock
  attr_accessor :charcoals, :arr_bowls, :arr_hookahs, :arr_tobacco

  def initialize
    @charcoals = 0
    @arr_bowls = []
    @arr_hookahs = []
    @arr_tobacco = []
  end

  def tobacco(name, price, amount)
    @arr_tobacco << Tobacco.new(name, price, amount)
  end

  def add_charcoals(amount)
    @charcoals += amount
  end

  def hookahs(name)
    @arr_hookahs << Hookah.new(name)
  end

  def bowls(type)
    @arr_bowls << Bowl.new(type)
  end
end