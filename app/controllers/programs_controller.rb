class ProgramsController < ApplicationController

    def new 
        if params[:category_id]
            @category = Category.find_by_id(params[:category_id])
            @program = @category.programs.build  
        else 
            @program = Program.new 
            @program.build_category
        end 
    end 

    def create 
        @program = Program.new(program_params)
        @program.user = current_user
        @program.seats_taken = 0

        @program.save 

        if @program.valid?
            redirect_to program_path(@program) 
        else 
            flash[:message] = @program.errors.full_messages.join(", ")
            redirect_to new_program_path
        end 
    end 

    def add_seat
        @program = Program.find_by(id: params[:id])

        if @program.add_seat(current_user)
            redirect_to programs_path
        else
            flash[:message] = "Program is full."
            redirect_to program_path(@program)
        end 
    end


    def open_seats
        @programs = Program.open_seat_programs
    end 

    def show 
        @program = Program.find_by(id: params[:id])
    end 

    def index 
        if params[:category_id]
            @category = Category.find_by_id(params[:category_id])
            @programs = @category.programs 
        else 
            @programs = Program.all.order(created_at: :desc)
        end 
    end 

    def edit 
        @program = Program.find_by(id: params[:id])
    end 

    def update
        @program = Program.find_by(id: params[:id])

        if @program.user == current_user
            @program.update(program_params)
            redirect_to program_path(@program)
        else 
            flash[:message] = @program.errors.full_messages.join(", ")
            redirect_to edit_program_path(@program)
        end 
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
        :category_id,
        category_attributes: [
            :cat 
        ]
      )
    end
end
