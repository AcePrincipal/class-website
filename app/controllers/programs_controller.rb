class ProgramsController < ApplicationController

    def new 
        @program = Program.new 
    end 

    def create 
        @program = Program.new(program_params) do |p|
            @category = Category.find_or_create_by(type: params[:category])
            p.category = @category
        end 
        @program.user = current_user

        @program.save 

        if @program
            redirect_to program_path(@program) 
        else 
            redirect_to new_program_path
        end 
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
