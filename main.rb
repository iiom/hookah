require_relative 'lib/table'
require_relative 'lib/hookah'
require_relative 'lib/bowl'
require_relative 'lib/stock'
require_relative 'lib/tobacco'
require_relative 'lib/order'

def show_id(where, type)
  temp_arr_id = []
  where.select {|elem| elem.status == type}.each {|elem| temp_arr_id << elem.id}
  temp_arr_id
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

reserved_hookahs = []
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

reserved_bowls = []
def reserv_bowl(reserved_bowls, stock, type_bowl = nil, id = nil)
  tmp = []
  if type_bowl == nil && id == nil
    array = []
    stock.arr_bowls.each {|i| array  << i.type}
    type_max = array.each_with_object({}) {|item, memo| memo[item] = array.count(item)}.max_by{|k, v| v}.first
    id = stock.arr_bowls.select {|i| i.type == type_max }.sample.id
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

stock = Stock.new
stock.tables(1, 2, 'free')
stock.tables(2, 4, 'free')
stock.tables(3, 6, 'free')
stock.tables(4, 4, 'free')
stock.tables(5, 6, 'free')
stock.add_charcoals(900)
stock.hookahs('Khalil Mamoon', 1)
stock.hookahs('Khalil Mamoon', 2)
stock.hookahs('Khalil Mamoon', 3)
stock.hookahs('Siriyan', 4)
stock.hookahs('Fabula', 5)
stock.hookahs('Meduse', 6)
stock.hookahs('Fumo', 7)
stock.bowls('Earthenware', 1)
stock.bowls('Phunnel', 2)
stock.bowls('Ceramic', 3)
stock.bowls('Ceramic', 4)
stock.bowls('Vortex', 5)
stock.bowls('Silicon', 6)
stock.tobacco('Adaliya', 10, 500)
stock.tobacco('Al_Fakher', 220, 800)
stock.tobacco('D_mini', 160, 550)
stock.tobacco('Dark_Side', 260, 900)
stock.tobacco('Dokha', 220, 650)
stock.tobacco('Nakhla', 180, 600)
stock.tobacco('WTO', 200, 700)

puts "amount of tables - #{stock.arr_tables.size}"
puts "hookahs - #{stock.arr_hookahs.size}"
puts "bowls - #{stock.arr_bowls.size}"
puts "amount of tobacco - #{stock.arr_tobacco.size}"
puts "amount of charcoals - #{stock.charcoals}"

puts '_______________________________'
order1 = Order.new(1)
order1.table = reserv_table(stock.arr_tables, 5)
order1.hookah << reserv_hookah(reserved_hookahs, stock, nil, 3)
order1.bowl << reserv_bowl(reserved_bowls, stock)
order1.tobacco << choice_tobaco(stock, 'Dark_Side')

puts "##{order1.order_number}\ntable ##{order1.table.first.id}\n"+
         "Hookah - #{order1.hookah.flatten.first.name}\nBowl - #{order1.bowl.flatten.first.type}\n"+
         "Tobacco - #{order1.tobacco.first.name}"

puts '_______________________________'
puts "free tables #: #{show_id(stock.arr_tables, 'free').join(', ')}; " +
         "reserved tables #: #{show_id(stock.arr_tables, 'reserv').join(', ')}"
puts "free hookah #: #{show_id(stock.arr_hookahs, 'free').join(', ')}; " +
         "reserved hookah #: #{show_id(reserved_hookahs, 'reserv').join(', ')}"
puts "free bowls #: #{show_id(stock.arr_bowls, 'free').join(', ')}; " +
         "reserved bowls #: #{show_id(reserved_bowls, 'reserv').join(', ')}"
puts '_______________________________'







