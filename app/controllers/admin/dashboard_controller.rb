class Admin::DashboardController < ApplicationController
  layout 'admin'
  before_action :authenticate_employee!

  def index
    @animals = Animal.all
    @events = Event.all
    @enclosures = Enclosure.all
    @notes = Note.all
    @reservations = Reservation.where("created_at > ?", 1.month.ago)
    @employees = Employee.all
  end
end
