class Stock
  attr_accessor :charcoals, :arr_bowl, :arr_hookah, :arr_tobacco

  def initialize
    @charcoals = 0
    @arr_bowl = []
    @arr_hookah = []
    @arr_tobacco = []
  end

  def tobacco(name, amount, price)
    @arr_tobacco << Tobacco.new(name, amount, price)
  end

  def add_charcoals(amount)
    @charcoals += amount
  end

  def hookahs(name)
    @arr_hookah << Hookah.new(name)
  end

  def bowls(type)
    @arr_bowl << Bowl.new(type)
  end
end