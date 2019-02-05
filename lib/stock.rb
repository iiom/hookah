class Stock
  attr_accessor :wto, :dokha, :d_mini, :adalya, :nakhla, :al_fakher, :dark_side, :charcoal

  def initialize(adalya = 200, al_fakher = 220, d_mini = 180, dark_side = 240, dokha = 160, nakhla = 200, wto = 220, charcoal = 900)
    @wto       = wto
    @dokha     = dokha
    @adalya    = adalya
    @d_mini    = d_mini
    @nakhla    = nakhla
    @al_fakher = al_fakher
    @dark_side = dark_side
    @charcoal  = charcoal
  end
end