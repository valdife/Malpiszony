module DashboardHelper
    def getEventHash(type)
        new_arr = {}
        if type == 1
            eventReservations = Reservation.joins(:event).where("start_time > ?",Date.today.to_s)
            eventReservations = eventReservations.group("event_id").count
        elsif type == 2
            eventReservations = Reservation.joins(:event).where(["EXTRACT(month from start_time) = ? and EXTRACT(year from start_time) = ?",Date.today.month,Date.today.year])
            eventReservations = eventReservations.group("event_id").count
        end
        eventReservations.each do |key,value|
            new_arr[Event.find(key).name] = eventReservations[key]
        end
        return new_arr.sort.to_h
    end
end
