class Stock
  attr_accessor :charcoals, :arr_bowls, :arr_hookahs, :arr_tobacco, :arr_tables

  def initialize
    @charcoals = 0
    @arr_bowls = []
    @arr_hookahs = []
    @arr_tobacco = []
    @arr_tables = []
  end

  arr_tables = []
  def tables(id_table, seats_number, status)
    arr_tables << Table.new(id_table, seats_number, status)
  end

  def tobacco(name, price, amount)
    @arr_tobacco << Tobacco.new(name, price, amount)
  end

  def add_charcoals(amount)
    @charcoals += amount
  end

  def hookahs(name, id)
    @arr_hookahs << Hookah.new(name, id)
  end

  def bowls(type, id)
    @arr_bowls << Bowl.new(type, id)
  end
end