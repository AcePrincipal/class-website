class ProgramsController < ApplicationController

    def new 
        @program = Program.new 
    end 

    def create 
        @program = Program.create(program_params)
        @category = Category.find_or_create_by(type: params[:category])

        if @program
            @program.category = @category

            redirect_to program_path(@program) 
        end 

        redirect_to new_program_path
    end 

    def show 
        @program = Program.find_by(id: params[:id])
    end 

    private
    def program_params
      params.require(:program).permit(
        :title,
        :description,
        :num_of_seats
      )
    end
end
