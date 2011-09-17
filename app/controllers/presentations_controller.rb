class PresentationsController < ApplicationController

    def index
    end

    def show
    end

    def new
        @presentation = Presentation.new
    end

    def create
        @presentation = params[:presentation]
        if @presentation.save
            flash[:success] = "Created yo presentation."
            redirect_to new_presentation_question_path(@presentation)
        else
            flash[:error] = "Check yo errors."
        end
    end

    def update
    end

    def destroy
    end

    def edit
    end

end
