require 'rspec'
require_relative 'support/support'

describe 'order' do
  before(:all) do
    @stock = Stock.new
    @stock.tables(1, 2, 'free')
    @stock.tables(2, 4, 'free')
    @stock.tables(3, 6, 'free')
    @stock.tables(4, 4, 'free')
    @stock.tables(5, 6, 'free')
    @stock.add_charcoals(900)
    @stock.hookahs('Khalil Mamoon', 1)
    @stock.hookahs('Khalil Mamoon', 2)
    @stock.hookahs('Khalil Mamoon', 3)
    @stock.hookahs('Siriyan', 4)
    @stock.hookahs('Fabula', 5)
    @stock.hookahs('Meduse', 6)
    @stock.hookahs('Fumo', 7)
    @stock.bowls('Earthenware', 1)
    @stock.bowls('Phunnel', 2)
    @stock.bowls('Ceramic', 3)
    @stock.bowls('Ceramic', 4)
    @stock.bowls('Vortex', 5)
    @stock.bowls('Silicon', 6)
    @stock.tobacco('Adaliya', 500, 10)
    @stock.tobacco('Al_Fakher', 800, 220)
    @stock.tobacco('D_mini', 550, 200)
    @stock.tobacco('Dark_Side', 900, 260)
    @stock.tobacco('Dokha', 650, 220)
    @stock.tobacco('Nakhla', 600, 160)
    @stock.tobacco('WTO', 700, 200)

    @order1 = Order.new(1)
    @order1.table = @order1.reserv_table(@stock, 5)
    @order1.hookah << @order1.reserv_hookah(@stock, nil, 3)
    @order1.bowl << @order1.reserv_bowl(@stock, nil, 2)
    @order1.tobacco << @order1.choice_tobaco(@stock, 'Dark_Side')
  end

  it 'true id number in order array of tables' do
    expect(@order1.table.first.id).to eq 5
  end

  it 'true id number in order array of hookah' do
    expect(@order1.hookah.flatten.first.id).to eq 3
  end

  it 'true id number in order array of hookah' do
    expect(@order1.tobacco.first.name).to eq 'Dark_Side'
  end

  it 'reduce amount tobacco after order' do
    expect(@stock.arr_tobacco.select{|i| i.name == 'Dark_Side'}.first.amount).to eq 240
  end

  it 'reduce amount charcoal after order' do
    expect(@stock.charcoals).to eq 892
  end

  it 'change status after reserv table' do
    expect(@stock.arr_tables.select{|i| i.id == 5}.first.status).to eq 'reserv'
  end

  it 'change status after reserv hookah' do
    expect(@stock.arr_hookahs.select{|i| i.id == 3}.first.status).to eq 'reserv'
  end

  it 'change status after reserv bowl' do
    expect(@stock.arr_bowls.select{|i| i.id == 2}.first.status).to eq 'reserv'
  end

  it 'return one of max count type' do
    expect([3, 4].include?(@order1.reserv_bowl(@stock).first.id)).to eq true
  end

  it 'change status after unreserv table' do
    @order1.unreserv_table(@stock.arr_tables, 5)
    expect(@stock.arr_tables.select{|i| i.id == 5}.first.status).to eq 'free'
  end

  it 'change status after unreserv hookah' do
    @order1.unreserv_hookah(@stock, 3)
    expect(@stock.arr_hookahs.select{|i| i.id == 3}.first.status).to eq 'free'
  end

  it 'change status after unreserv bowl' do
    @order1.unreserv_bowl(@stock, 2)
    expect(@stock.arr_bowls.select{|i| i.id == 2}.first.status).to eq 'free'
  end
end

