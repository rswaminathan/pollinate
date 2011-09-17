class QuestionsController < ApplicationController

    def index
    end

    def new
        @presentation = Presentation.find(params[:presentation_id])
        @question = @presentation.questions.build
    end

    def create
        @presentation = Presentation.find(params[:presentation_id])
        @question = @presentation.questions.build(params[:question])
        if @question.save
            flash[:success] = "Your question has been saved. You may create another one."
            redirect_to new_presentation_question_path(@presentation)
        else
            flash[:error] = "Something went wrong"
        end
    end

    def update
    end

    def edit
    end

    def destroy
    end

    def show
    end

end
