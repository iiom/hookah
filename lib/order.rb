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

  def reserv_table(arr_tables, id)
    tmp = []
    arr_tables.select {|elem| elem.id == id}.first.status = 'reserv'
    tmp << arr_tables.select {|elem| elem.id == id}
    puts "no more free table" if show_id(arr_tables, 'free').size == 0
    tmp.flatten!
  end

  def unreserv_table(arr_tables, id)
    arr_tables.select {|elem| elem.id == id}.first.status = 'free'
  end

  def reserv_hookah(reserved_hookahs, stock, name_hookah = nil, id = nil)
    tmp = []
    id = stock.arr_hookahs.sample.id if name_hookah == nil && id == nil
    id = stock.arr_hookahs.select {|i| i.name == name_hookah}.first.id if name_hookah != nil && id == nil
    (tmp << stock.arr_hookahs.select {|i| i.id == id}).flatten!
    (reserved_hookahs << stock.arr_hookahs.select {|i| i.id == id}).flatten!
    stock.arr_hookahs.delete_if {|i| i.id == id}
    reserved_hookahs.select {|i| i.id == id}.first.status = 'reserv'
    tmp
  end

  def unreserv_hookah(reserved_hookahs, stock, id)
    (stock.arr_hookahs << reserved_hookahs.select {|i| i.id == id}).flatten!
    reserved_hookahs.delete_if {|i| i.id == id}
    stock.arr_hookahs.select {|i| i.id == id}.first.status = 'free'
  end

  def reserv_bowl(reserved_bowls, stock, type_bowl = nil, id = nil)
    tmp = []
    if type_bowl == nil && id == nil
      array = []
      stock.arr_bowls.each {|i| array << i.type}
      type_max = array.each_with_object({}) {|item, memo| memo[item] = array.count(item)}.max_by {|k, v| v}.first
      id = stock.arr_bowls.select {|i| i.type == type_max}.sample.id
    end
    id = stock.arr_bowls.select {|i| i.type == type_bowl}.first.id if type_bowl != nil && id == nil
    (tmp = stock.arr_bowls.select {|i| i.id == id}).flatten!
    (reserved_bowls << stock.arr_bowls.select {|i| i.id == id}).flatten!
    stock.arr_bowls.delete_if {|i| i.id == id}
    reserved_bowls.select {|i| i.id == id}.first.status = 'reserv'
    tmp
  end

  def unreserv_bowl(reserved_bowls, stock, id)
    (stock.arr_bowls << reserved_bowls.select {|i| i.id == id}).flatten!
    reserved_bowls.delete_if {|i| i.id == id}
    stock.arr_bowls.select {|i| i.id == id}.first.status = 'free'
  end

  def choice_tobaco(stock, name)
    tmp = []
    tmp = stock.arr_tobacco.select {|i| i.name == name}.first
    stock.arr_tobacco.select {|i| i.name == name}.first.amount -= 20
    stock.charcoals -= 8
    puts "small balance #{stock.charcoals}" if stock.charcoals < 100
    puts "small balance #{name}" if stock.arr_tobacco.select {|i| i.name == name}.first.amount < 60
    tmp
  end
end