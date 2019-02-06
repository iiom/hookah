class Hookah
  attr_reader :name, :id
  attr_accessor :status

  def initialize(name, id)
    @id = id
    @name = name
    @status = 'free'
  end
end