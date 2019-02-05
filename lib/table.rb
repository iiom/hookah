class Table
  attr_reader :id_table, :seats_number
  attr_accessor :status

  def initialize(id_table, seats_number, status)
    @id_table     = id_table
    @seats_number = seats_number
    @status       = status
  end
end