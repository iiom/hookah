require 'rspec'
require_relative 'support/support'

describe 'stock ballance' do
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
  end

  it 'show charcoals ballance true' do
    expect(@stock.charcoals).to eq 900
  end

  it 'show arr_tables ballance true' do
    expect(@stock.arr_tables.size).to eq 5
  end

  it 'show arr_hookah ballance true' do
    expect(@stock.arr_hookahs.size).to eq 7
  end

  it 'show arr_tobacco ballance true' do
    expect(@stock.arr_tobacco.size).to eq 7
  end

  it 'show Adaliya amount true' do
    expect(@stock.arr_tobacco.select{|i| i.name == 'Adaliya'}.first.amount).to eq 10
  end

  it 'show Al_Fakher amount true' do
    expect(@stock.arr_tobacco.select{|i| i.name == 'Al_Fakher'}.first.amount).to eq 220
  end

  it 'show D_mini amount true' do
    expect(@stock.arr_tobacco.select{|i| i.name == 'D_mini'}.first.amount).to eq 200
  end

  it 'show Dark_Side amount true' do
    expect(@stock.arr_tobacco.select{|i| i.name == 'Dark_Side'}.first.amount).to eq 260
  end

  it 'show Dokha amount true' do
    expect(@stock.arr_tobacco.select{|i| i.name == 'Dokha'}.first.amount).to eq 220
  end

  it 'show Nakhla amount true' do
    expect(@stock.arr_tobacco.select{|i| i.name == 'Nakhla'}.first.amount).to eq 160
  end

  it 'show WTO amount true' do
    expect(@stock.arr_tobacco.select{|i| i.name == 'WTO'}.first.amount).to eq 200
  end

  it 'show Adaliya true price' do
    expect(@stock.arr_tobacco.select{|i| i.name == 'Adaliya'}.first.price).to eq 500
  end

  it 'show Al_Fakher true price' do
    expect(@stock.arr_tobacco.select{|i| i.name == 'Al_Fakher'}.first.price).to eq 800
  end

  it 'show D_mini true price' do
    expect(@stock.arr_tobacco.select{|i| i.name == 'D_mini'}.first.price).to eq 550
  end

  it 'show Dark_Side true price' do
    expect(@stock.arr_tobacco.select{|i| i.name == 'Dark_Side'}.first.price).to eq 900
  end

  it 'show Dokha true price' do
    expect(@stock.arr_tobacco.select{|i| i.name == 'Dokha'}.first.price).to eq 650
  end

  it 'show Nakhla true price' do
    expect(@stock.arr_tobacco.select{|i| i.name == 'Nakhla'}.first.price).to eq 600
  end

  it 'show WTO true price' do
    expect(@stock.arr_tobacco.select{|i| i.name == 'WTO'}.first.price).to eq 700
  end
end
