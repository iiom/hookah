require_relative 'lib/table'
require_relative 'lib/hookah'
require_relative 'lib/bowl'
require_relative 'lib/store'

puts '---------Table------------'
p Table.new(1, 4, 'free')
p Table.new(1, 2, 'free')
p Table.new(1, 8, 'free')
p Table.new(1, 4, 'free')
p Table.new(1, 2, 'free')
puts '--------HOOKAH------------'
p Hookah.new('Khalil Mamoon')
p Hookah.new('MEDUSE')
p Hookah.new('FUMO')
p Hookah.new('Fabula')
p Hookah.new('Syrian')
puts '---------BOWL-------------'
p Bowl.new('earthenware')
p Bowl.new('ceramic')
p Bowl.new('vortex')
p Bowl.new('silicone')
puts '--------STOCk------------'
p Stock.new