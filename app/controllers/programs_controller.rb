class ProgramsController < ApplicationController

    def new 
        @program = Program.new 
        @program.build_category
    end 

    def create 
        @program = Program.new(program_params)
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

    def index 
        @programs = Program.all 
    end 

    def edit 
        @program = Program.find_by(id: params[:id])
    end 

    def update
        @program = Program.find_by(id: params[:id])
        @program.update(program_params)
        redirect_to program_path(@program)
    end

    def destroy
        @program = Program.find_by(id: params[:id])
        if current_user == @program.user
            @program.delete

            redirect_to programs_path
        else
            redirect_to programs_path
        end 
    end 

    private
    def program_params
      params.require(:program).permit(
        :title,
        :description,
        :num_of_seats,
        category_attributes: [
            :cat 
        ]
      )
    end
end
