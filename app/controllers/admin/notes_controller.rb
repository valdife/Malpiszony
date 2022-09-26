class Admin::NotesController < ApplicationController
    layout 'admin'
    before_action :authenticate_employee!

    def new
      @note = Note.new
      @animal_id = params[:animal_id]
      @animal = Animal.find(@animal_id)
    end

    def create
      @note = Note.new(notes_params)
      @animal_id = params[:animal_id]
      if @note.save
        redirect_to admin_animal_path(@animal_id)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @note = Note.find(params[:id])
      @note.destroy
      @animal_id = params[:animal_id]
      redirect_to admin_animal_path(@animal_id), status: :see_other
    end

    private
    def notes_params
      params.require(:note).permit(:content, :date, :animal_id, :employee_id)
    end
end
