module ProgramsHelper
    def display_header(category)
        if category 
            content_tag(:h1, "#{category.cat} Programs")
        else
            content_tag(:h1, "All Programs")
        end
    end 

    def program_select(f)
        if params[:category_id]
            f.hidden_field :category_id
        else 
            render partial: "cat_select", locals: {f: f}
        end 
    end 
end
