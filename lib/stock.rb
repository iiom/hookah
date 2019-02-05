class Stock

  def initialize
    @charcoal  = 0
  end

  def tobacco(name, amount, price)
    arr_tobacco ||= []
    arr_tobacco << Tobacco.new(name, amount, price)
    arr_tobacco
  end

  def charcoals(charcoal)
    @charcoal += charcoal
  end

  def hookahs(name)
    arr_hookah ||= []
    arr_hookah << Hookah.new(name)
    arr_hookah
  end

  def bowls(type)
    arr_bowl ||= []
    arr_bowl << Bowl.new(type)
    arr_bowl
  end
end