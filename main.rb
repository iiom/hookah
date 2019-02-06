require_relative 'lib/table'
require_relative 'lib/hookah'
require_relative 'lib/bowl'
require_relative 'lib/stock'
require_relative 'lib/tobacco'

arr_tables = []

def tables(arr_tables, id_table, seats_number, status)
  arr_tables << Table.new(id_table, seats_number, status)
end

def show_id(where, type)
  temp_arr_id = []
  where.select {|elem| elem.status == type}.each {|elem| temp_arr_id << elem.id}
  temp_arr_id
end

def reserv_table(arr_tables, id)
  arr_tables.select {|elem| elem.id == id}.first.status = 'reserv'
  puts "no more free table" if show_id(arr_tables, 'free').size == 0
end

def unreserv_table(arr_tables, id)
  arr_tables.select {|elem| elem.id == id}.first.status = 'free'
end

reserv_hookahs = []
def reserv_hookah(reserv_hookahs, stock, name_hookah = nil, id = nil)
  id = stock.arr_hookahs.sample.id if name_hookah == nil && id == nil
  id = stock.arr_hookahs.sample.name if name_hookah != nil && id == nil
  (reserv_hookahs << stock.arr_hookahs.select {|i| i.id == id}).flatten!
  stock.arr_hookahs.delete_if {|i| i.id == id}
  reserv_hookahs.select {|i| i.id == id}.first.status = 'reserv'
end

def unreserv_hookah(reserv_hookahs, stock, id)
  (stock.arr_hookahs << reserv_hookahs.select {|i| i.id == id}).flatten!
  reserv_hookahs.delete_if {|i| i.id == id}
  stock.arr_hookahs.select {|i| i.id == id}.first.status = 'free'
end
##############################################################
reserv_bowls = []
def reserv_bowl(reserv_bowls, stock, type_bowl = nil, id = nil)
  id = stock.arr_bowls.sample.id if type_bowl == nil && id == nil
  id = stock.arr_bowls.select {|i| i.type == type_bowl}.first.id if type_bowl != nil && id == nil
  reserv_bowls << stock.arr_bowls.select {|i| i.id == id}
  stock.arr_bowls.delete_if {|i| i.id == id}
  reserv_bowls.flatten!
  reserv_bowls.select {|i| i.id == id}.first.status = 'reserv'
end

def unreserv_bowl(reserv_bowls, stock, id)
  stock.arr_bowls << reserv_bowls.select {|i| i.id == id}
  reserv_bowls.delete_if {|i| i.id == id}
  stock.arr_bowls.flatten!
  stock.arr_bowls.select {|i| i.id == id}.first.status = 'free'
end
###############################################################
def choice_tobaco(stock, name)
  stock.arr_tobacco.select {|i| i.name == name}.first.amount -= 20
  stock.charcoals -= 8
end

tables(arr_tables, 1, 2, 'free')
tables(arr_tables, 2, 4, 'free')
tables(arr_tables, 3, 6, 'free')
tables(arr_tables, 4, 4, 'free')
tables(arr_tables, 5, 6, 'free')

stock = Stock.new
stock.add_charcoals(900)
stock.hookahs('Khalil Mamoon', 1)
stock.hookahs('Khalil Mamoon',2)
stock.hookahs('Khalil Mamoon',3)
stock.hookahs('Siriyan',4)
stock.hookahs('Fabula',5)
stock.hookahs('Meduse',6)
stock.hookahs('Fumo',7)
stock.bowls('Earthenware',1)
stock.bowls('Phunnel',2)
stock.bowls('Ceramic',3)
stock.bowls('Ceramic',4)
stock.bowls('Vortex',5)
stock.bowls('Silicon',6)
stock.tobacco('Adaliya', 10, 500)
stock.tobacco('Al_Fakher', 220, 800)
stock.tobacco('D_mini', 160, 550)
stock.tobacco('Dark_Side', 260, 900)
stock.tobacco('Dokha', 220, 650)
stock.tobacco('Nakhla', 180, 600)
stock.tobacco('WTO', 200, 700)

puts "amount of tables - #{arr_tables.size}"
puts "hookahs - #{stock.arr_hookahs.size}"
puts "bowls - #{stock.arr_bowls.size}"
puts "amount of tobacco - #{stock.arr_tobacco.size}"
puts "amount of charcoals - #{stock.charcoals}"

reserv_table(arr_tables, 2)
reserv_table(arr_tables, 4)
reserv_table(arr_tables, 1)
unreserv_table(arr_tables, 1)
reserv_hookah(reserv_hookahs, stock, nil, 3)
reserv_hookah(reserv_hookahs, stock, nil, 4)
unreserv_hookah(reserv_hookahs, stock,4)

reserv_bowl(reserv_bowls, stock, nil, 2)
reserv_bowl(reserv_bowls, stock)
unreserv_bowl(reserv_bowls, stock, 2)

choice_tobaco(stock, 'Dark_Side')

puts '_______________________________'
puts "free tables #: #{show_id(arr_tables, 'free').join(', ')}; "+
"reserved tables #: #{show_id(arr_tables, 'reserv').join(', ')}"
puts "free hookah #: #{show_id(stock.arr_hookahs, 'free').join(', ')}; "+
"reserved hookah #: #{show_id(reserv_hookahs, 'reserv').join(', ')}"
puts "free bowls #: #{show_id(stock.arr_bowls, 'free').join(', ')}; "+
"reserved bowls #: #{show_id(reserv_bowls, 'reserv').join(', ')}"
puts '_______________________________'







