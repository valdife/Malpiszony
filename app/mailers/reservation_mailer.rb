class ReservationMailer < ApplicationMailer
    def new_reservation_email
        @reservation = params[:reservation]
    
        mail(to: @reservation.email, subject: "Rezerwacja na wydarzenie w Zoo Pazurek")
      end
end
