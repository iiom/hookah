class Table
  attr_reader :id, :seats_number
  attr_accessor :status

  def initialize(id, seats_number, status)
    @id = id
    @seats_number = seats_number
    @status = status
  end
end