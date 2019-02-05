require_relative 'lib/table'
require_relative 'lib/hookah'
require_relative 'lib/bowl'
require_relative 'lib/stock'

puts '---------Table------------'
arr_tables = []
def tables(arr_tables, arg1, arg2, status)
  arr_tables << Table.new(arg1, arg2, status)
end
tables(arr_tables, 1,2, 'free')
tables(arr_tables, 2,4, 'free')
tables(arr_tables, 3,6, 'free')
tables(arr_tables, 4,4, 'free')
tables(arr_tables, 5,6, 'free')
puts arr_tables

puts '--------STOCk------------'
p Stock.new