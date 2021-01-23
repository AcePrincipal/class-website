class CategoriesController < ApplicationController
    def index 
        @categories = Category.all
    end 

    def show 
        @category = Category.find_by(id: params[:id])
        @programs = Program.where(category_id: @category.id).order(created_at: :desc)

        redirect_to "/categories/#{@category.id}/programs"
    end 
end
