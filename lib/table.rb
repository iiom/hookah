class Table
  attr_reader :id_table, :seats_number
  attr_accessor :status

  def initialize(arg1, arg2, status)
    @id_table     = arg1
    @seats_number = arg2
    @status       = status
  end
end