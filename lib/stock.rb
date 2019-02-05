class Stock
  attr_accessor :wto, :dokha, :d_mini, :adalya, :nakhla, :al_fakher, :dark_side, :charcoal

  def initialize
    @wto       = 0
    @dokha     = 0
    @adalya    = 0
    @d_mini    = 0
    @nakhla    = 0
    @al_fakher = 0
    @dark_side = 0
    @charcoal  = 0
  end

  def tobacco(name, amount)
    @wto += amount if name == 'wto'
    @dokha += amount if name == 'dokha'
    @nakhla += amount if name == 'nakhla'
    @adalya += amount if name == 'adalya'
    @d_mini += amount if name == 'd_mini'
    @charcoal += amount if name == 'charcoal'
    @al_fakher += amount if name == 'al_faker'
    @dark_side += amount if name == 'dark_side'
  end

  def charcoals(charcoal)
    @charcoal ||= 0
    @charcoal += charcoal
  end

  def hookahs(name)
    arr_hookah ||= []
    arr_hookah << Hookah.new(name)
    arr_hookah
  end

  def bowls(type)
    arr_bowl ||= []
    arr_bowl << Bowl.new(type)
    arr_bowl
  end
end