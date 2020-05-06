class RentalMailer < ApplicationMailer

  def rental_scheduled(rental_id)
    @rental = Rental.find(rental_id)
    customer = @rental.customer
    #return if customer.cancelled? #guard clause

    mail(to: customer.email, subject: "Confirmação de Agendamento - #{ @rental.code }" )
  end

  def rental_ongoing
  end

end