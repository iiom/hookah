require_relative 'lib/table'
require_relative 'lib/hookah'
require_relative 'lib/bowl'
require_relative 'lib/stock'
require_relative 'lib/tobacco'
require_relative 'lib/order'

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


order1 = Order.new(1)
order1.table = order1.reserv_table(stock, 5)
order1.hookah << order1.reserv_hookah(stock, nil, 3)
order1.bowl << order1.reserv_bowl(stock)
order1.tobacco << order1.choice_tobaco(stock, 'Dark_Side')

puts '_______________________________'
puts "##{order1.order_number}\ntable ##{order1.table.first.id}\n" +
         "Hookah - #{order1.hookah.flatten.first.name}\nBowl - #{order1.bowl.flatten.first.type}\n" +
         "Tobacco - #{order1.tobacco.first.name}"








