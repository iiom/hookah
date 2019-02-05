class Bowl
  attr_reader :type
  attr_accessor :status

  def initialize(type)
    @type = type
    @status = 'free'
  end
end