class CategoriesController < ApplicationController
    before_action :redirect_if_not_logged_in, :current_user

    def index 
        @categories = Category.all.sort_by{ |c| c.cat}
    end 

    def show 
        @category = Category.find_by(id: params[:id])
        @programs = Program.where(category_id: @category.id).order(created_at: :desc)

        redirect_to "/categories/#{@category.id}/programs"
    end 
end
