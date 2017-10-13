require_relative("../db/sql_runner")
require_relative("film.rb")
require_relative("customer.rb")

class Ticket

  attr_reader :id
  attr_accessor :film_id, :customer_id

  def initialize(options)
    @id = options['id'].to_i
    @film_id = options['film_id']
    @customer_id = options['customer_id']
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [@customer_id]
    result = SqlRunner.run(sql, values)[0]
    return Customer.new(result)
  end

  def film()
    sql = "SELECT * FROM films WHERE id = $1"
    values = [@film_id]
    result = SqlRunner.run(sql, values)[0]
    return Film.new(result)
  end

  def save()
    sql = "INSERT INTO tickets(film_id, customer_id)
    VALUES($1, $2)
    RETURNING id"
    values = [@film_id, @customer_id]
    tickets = SqlRunner.run(sql, values).first
    @id = tickets['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    values = []
    tickets = SqlRunner.run(sql, values)
    results = tickets.map{|ticket| Ticket.new (ticket)}
    return results
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    values = []
    SqlRunner.run(sql, values)
  end

end
