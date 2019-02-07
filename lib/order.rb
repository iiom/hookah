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

  # бронирование стола
  def reserv_table(arr_tables, id)
    tmp = []
    # через селект выбираем из массива все элементы соответствующие условию. так как результат выполнения
    # select есть новый массив на нём дёргается метод first и выбирается сущность стола на котором вызывается
    # параметр status который создаётся при создании объекта и меняется статус с "свободного" на "резерв"
    arr_tables.select {|elem| elem.id == id}.first.status = 'reserv'
    # во временый массив заносится сущность стола по id
    tmp << arr_tables.select {|elem| elem.id == id}
    # выводим сообщение если спосле брони столов не оказалось свободных
    puts "no more free table" if show_id(arr_tables, 'free').size == 0
    # возвращаем временный массив расплющивая его чтобы этот результат потом перенести в массив заказа
    # order1.table = order1.reserv_table(stock.arr_tables, 5)
    tmp.flatten!
  end

  # снятие брони стола
  def unreserv_table(arr_tables, id)
    # снятие брони со стола
    arr_tables.select {|elem| elem.id == id}.first.status = 'free'
  end

  # бронирование кальяна
  def reserv_hookah(stock, name_hookah = nil, id = nil)
    tmp = []
    # по условию если не передано название кальяна (или его номер) то из массива выбираем любой кальян
    # по номеру, чтобы избежать проблем при дубляже при бронировании или снятии брони (в частности)
    id = stock.arr_hookahs.sample.id if name_hookah == nil && id == nil
    # по условию если передано название кальяна, то из массива кальянов на складе выбираем все кальяны
    # с таким именен и берём у него номер, чтобы избежать проблем при снятии брони если несколько кальянов
    # с одним названием.
    id = stock.arr_hookahs.select {|i| i.name == name_hookah}.first.id if name_hookah != nil && id == nil
    # меняем статус этого кальяна
    stock.arr_hookahs.select {|i| i.id == id}.first.status = 'reserv'
    # во временый массив заносится сущность кальяна по id расплющивая массив мутатором
    (tmp << stock.arr_hookahs.select {|i| i.id == id}).flatten!
    # возвращаем временный массив с кальянов, чтобы передать его массив кальянов в заказ
    # order1.hookah << order1.reserv_hookah(reserved_hookahs, stock, nil, 3)
    tmp
  end

  # снятие брони кальяна
  def unreserv_hookah(stock, id)
    stock.arr_hookahs.select {|i| i.id == id}.first.status = 'free'
  end

  # бронирование чаши
  def reserv_bowl(stock, type_bowl = nil, id = nil)
    tmp = []
    # по условию если не перданно какая чаща, то берётся та которых на складе больше всего по типу
    if type_bowl == nil && id == nil
      array = []
      # из массива чаш на складе через итератор выдёргиваем все названия типов чаш в новый временный массив
      stock.arr_bowls.each {|i| array << i.type}
      # на этом временном массиве дёргаем метод с объектом в котором подсчитываем сколько встречается
      # повторяющихся нахваний, получаем хеш в котором указано название и сколько раз оно встречается
      # дале на этом хеше выбираем пару ключ значение с максимальным числом на счётчике. получается массив с названиями
      # чаш и выьираем первый элемент который будет названием чаши которых больше всего на складе по типу
      type_max = array.each_with_object({}) {|item, memo| memo[item] = array.count(item)}.max_by {|k, v| v}.first
      # дальше по этому названию из массива чаш на складе выбираем все чашы с таким названием, берётся случайный
      # объект и берётся его номер
      id = stock.arr_bowls.select {|i| i.type == type_max}.sample.id
    end
    # если по условию есть название чаши то по названию выбираются все чаши, берётся случайная и берётся её номер
    id = stock.arr_bowls.select {|i| i.type == type_bowl}.first.id if type_bowl != nil && id == nil
    # меняется статус чаши на "в работе"
    stock.arr_bowls.select {|i| i.id == id}.first.status = 'reserv'
    # во временный массив передаём этот объект чаши
    (tmp = stock.arr_bowls.select {|i| i.id == id}).flatten!
    # возврашается временный массив для передачи его в масив чаш в заказ
    tmp
  end

  # снятие брони чаши
  def unreserv_bowl(stock, id)
    stock.arr_bowls.select {|i| i.id == id}.first.status = 'free'
  end

  # выбор табака + уголь
  def choice_tobaco(stock, name)
    tmp = []
    tmp = stock.arr_tobacco.select {|i| i.name == name}.first
    # выбор и табака и сразу уменьшение его количества на складе на число требуемое для одной дозы
    stock.arr_tobacco.select {|i| i.name == name}.first.amount -= 20
    # сразу и уголь
    stock.charcoals -= 8
    # оповещение после заказа остатки минимальные
    puts "small balance #{stock.charcoals}" if stock.charcoals < 100
    puts "small balance #{name}" if stock.arr_tobacco.select {|i| i.name == name}.first.amount < 60
    tmp
  end
end