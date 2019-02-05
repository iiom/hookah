require_relative 'lib/table'
require_relative 'lib/hookah'
require_relative 'lib/bowl'
require_relative 'lib/stock'
require_relative 'lib/tobacco'

arr_tables = []
def tables(arr_tables, id_table, seats_number, status)
  arr_tables << Table.new(id_table, seats_number, status)
end

tables(arr_tables, 1,2, 'free')
tables(arr_tables, 2,4, 'free')
tables(arr_tables, 3,6, 'free')
tables(arr_tables, 4,4, 'free')
tables(arr_tables, 5,6, 'free')

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
stock.tobacco('Adaliya',200 , 500)
stock.tobacco('Al_Fakher',220 , 800)
stock.tobacco('D_mini',160 , 550)
stock.tobacco('Dark_Side',260 , 900)
stock.tobacco('Dokha',220 , 650)
stock.tobacco('Nakhla',180 , 600)
stock.tobacco('WTO',200 , 700)

puts "amount of tables - #{arr_tables.size}"
puts "hookahs - #{stock.arr_hookah.size}"
puts "bowls - #{stock.arr_bowl.size}"
puts "amount of tobacco - #{stock.arr_tobacco.size}"
puts "amount of charcoals - #{stock.charcoals}"

puts "little charcoal #{stock.charcoals}" if stock.charcoals < 100


puts "little tobacco #{stock.charcoals}" if stock.charcoals < 100
