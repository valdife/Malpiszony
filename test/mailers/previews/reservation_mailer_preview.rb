# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview
    def new_reservation_email
            reservation =  Reservation.new(first_name: "Bartek", last_name: "Dec", phone: 666666666, email: "bapidec@gmail.com", event_id: 1)
            ReservationMailer.with(reservation: reservation).new_reservation_email
    end
end
