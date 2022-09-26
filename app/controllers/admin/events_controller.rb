class Admin::EventsController < ApplicationController
    layout 'admin'
    before_action :authenticate_employee!

    def index
      @events = Event.all
    end

    def show
      @events = Event.find(params[:id])
    end
    
    def new
      @events = Event.new
      @enclosures_ids = Enclosure.all.collect(&:id)
    end
  
    def create
      @events = Event.new(events_params)
      @enclosures_ids = Enclosure.all.collect(&:id)
      if @events.save
        redirect_to [:admin, @events]
      else
        render :new, status: :unprocessable_entity
      end
    end
    
    def edit
      @events = Event.find(params[:id])
      @enclosures_ids = Enclosure.all.collect(&:id)
    end
  
    def update
      @events = Event.find(params[:id])
      @enclosures_ids = Enclosure.all.collect(&:id)
      if @events.update(events_params)
        redirect_to [:admin, @events]
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @events = Event.find(params[:id])
      @events.destroy
  
      redirect_to "/admin/events/", status: :see_other
    end
  
    private
      def events_params
        params.require(:event).permit(:name, :start_time, :end_time, :enclosure_id, :description)
      end
end

