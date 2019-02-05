require_relative 'lib/table'
require_relative 'lib/hookah'
require_relative 'lib/bowl'
require_relative 'lib/stock'
require_relative 'lib/tobacco'

arr_tables = []
def tables(arr_tables, id_table, seats_number, status)
  arr_tables << Table.new(id_table, seats_number, status)
end

def show_free_tables(arr_tables)
  arr_id_tables = []
  arr_tables.select {|elem| elem.status == 'free'}.each {|elem| arr_id_tables << elem.id_table}
  arr_id_tables
end

def reserv_table(arr_tables, id_table)
  arr_tables.select {|elem| elem.id_table == id_table}.first.status = 'reserv'
  puts "no more free table" if show_free_tables(arr_tables).size == 0
end

def unreserv_table(arr_tables, id_table)
  arr_tables.select {|elem| elem.id_table == id_table}.first.status = 'free'
end

reserv_hookahs = []
def reserv_hookah(reserv_hookahs, stock, name_hookah = nil)
  name_hookah = stock.arr_hookahs.sample.name if name_hookah == nil
  reserv_hookahs << stock.arr_hookahs.select {|i| i.name == name_hookah}
  stock.arr_hookahs.delete_if {|i| i.name == name_hookah}
  reserv_hookahs.flatten!
  reserv_hookahs.select {|i| i.name == name_hookah}.first.status = 'reserv'
end

def unreserv_hookah(reserv_hookahs, stock, name_hookah)
  stock.arr_hookahs << reserv_hookahs.select {|i| i.name == name_hookah}
  reserv_hookahs.delete_if {|i| i.name == name_hookah}
  stock.arr_hookahs.flatten!
  stock.arr_hookahs.select {|i| i.name == name_hookah}.first.status = 'free'
end

reserv_bowls = []
def reserv_bowl(reserv_bowls, stock, type_bowl = nil)
  type_bowl = stock.arr_bowls.sample.type if type_bowl == nil
  reserv_bowls << stock.arr_bowls.select {|i| i.type == type_bowl}
  stock.arr_bowls.delete_if {|i| i.type == type_bowl}
  reserv_bowls.flatten!
  reserv_bowls.select {|i| i.type == type_bowl}.first.status = 'reserv'
end

def unreserv_bowl(reserv_bowls, stock, type_bowl)
  stock.arr_bowls << reserv_bowls.select {|i| i.type == type_bowl}
  reserv_bowls.delete_if {|i| i.type == type_bowl}
  stock.arr_bowls.flatten!
  stock.arr_bowls.select {|i| i.type == type_bowl}.first.status = 'free'
end

tables(arr_tables, 1, 2, 'free')
tables(arr_tables, 2, 4, 'free')
tables(arr_tables, 3, 6, 'free')
tables(arr_tables, 4, 4, 'free')
tables(arr_tables, 5, 6, 'free')

stock = Stock.new
stock.add_charcoals(900)
stock.hookahs('Khalil Mamoon')
stock.hookahs('Siriyan')
stock.hookahs('Fabula')
stock.hookahs('Meduse')
stock.hookahs('Fumo')
stock.bowls('Earthenware')
stock.bowls('Phunnel')
stock.bowls('Ceramic')
stock.bowls('Vortex')
stock.bowls('Silicon')
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
unreserv_table(arr_tables,1)

puts "free tables № #{show_free_tables(arr_tables).join(', ')}"

reserv_hookah(reserv_hookahs, stock)
reserv_bowl(reserv_bowls, stock)



