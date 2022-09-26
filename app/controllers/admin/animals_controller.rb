class Admin::AnimalsController < ApplicationController
  layout 'admin'
  before_action :authenticate_employee!

  def index
    @animals = Animal.all.order("id")
  end
  
  def show
    @animals = Animal.find(params[:id])
    @notes = @animals.note
  end
  
  def new
    @animals = Animal.new
    @enclosures_ids = Enclosure.all.collect(&:id)
  end

  def create
    @animals = Animal.new(animals_params)

    if @animals.save
      redirect_to [:admin, @animals]
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @animals = Animal.find(params[:id])
    @enclosures_ids = Enclosure.all.collect(&:id)
  end

  def update
    @animals = Animal.find(params[:id])

    if @animals.update(animals_params)
      redirect_to [:admin, @animals]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @animals = Animal.find(params[:id])
    @animals.destroy

    redirect_to "/admin/animals", status: :see_other
  end

  private
    def animals_params
      params.require(:animal).permit(:name, :species, :age, :description, :enclosure_id)
    end
end
