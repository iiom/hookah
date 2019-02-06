class Bowl
  attr_reader :type, :id
  attr_accessor :status

  def initialize(type, id)
    @id = id
    @type = type
    @status = 'free'
  end
end