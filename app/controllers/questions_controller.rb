class QuestionsController < ApplicationController

    def index
    end

    def chart
        @question = Question.find(params[:question_id])
        @results = @question.get_result_count
        @result_names = @question.choices.values.find_all {| x | x != "" }
    end

    def enable
        @presentation = Presentation.find(params[:presentation_id])
        @question = Question.find(params[:question_id])
        @question.enabled = !@question.enabled
        if @question.save
            flash[:success] = "Question changed"
        else
            flash[:error] = "Can't be enabled"
        end
        redirect_to presentation_results_path(@presentation)
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
            redirect_to dashboard_path(@presentation)
        else
            flash[:error] = "Something went wrong"
        end
    end

    def update
        @presentation = Presentation.find(params[:presentation_id])
        @question = Question.find(params[:id])
        @question.update_attributes(params[:question])
        if @question.save
            flash[:success] = "Your question has been saved."
        else
            flash[:error] = "Something went wrong"
        end
        redirect_to presentation_results_path(@presentation)
    end
    
    def location
    end
    

    def edit
      @presentation = Presentation.find(params[:presentation_id])
       @question = Question.find(params[:id])
    end

    def destroy
      @presentation = Presentation.find(params[:presentation_id])
       @question = Question.find(params[:id])
    end

    def show
    end

end
