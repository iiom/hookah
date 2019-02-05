class Hookah
  attr_reader :name
  attr_accessor :status

  def initialize(name)
    @name = name
    @status = 'free'
  end
end