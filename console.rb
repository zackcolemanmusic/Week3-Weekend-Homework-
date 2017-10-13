require_relative( './models/customer.rb' )
require_relative( './models/film.rb' )
require_relative( './models/ticket.rb' )

require('pry')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()


film_1 = Film.new({ 'title' => 'Bad Boys 3', 'price' => 10 })
film_1.save()
film_2 = Film.new({ 'title' => 'N.W.A', 'price' => 10})
film_2.save()

customer_1 = Customer.new({ 'name' => 'Zack', 'funds' => 20})
customer_1.save()
customer_2 = Customer.new({ 'name' => 'Fred', 'funds' => 30})
customer_2.save()

ticket_1 = Ticket.new({ 'film_id' => film_1.id, 'customer_id' => customer_1.id})
ticket_1.save()
ticket_2 = Ticket.new({ 'film_id' => film_2.id, 'customer_id' => customer_2.id})
ticket_2.save()

binding.pry
nil
