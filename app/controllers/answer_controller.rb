class AnswerController < ApplicationController
    def create
        @presentation = Presentation.find(params[:presentation_id])
        @question = Question.find(params[:question_id])
        @answer= @question.answers.build(params[:answer])
        if @answer.save
            flash[:success] = "Saved your answer. Answer another question. "
        else
            flash[:error] = "Something went wrong when saving your answer. Try again."
        end
        redirect_to presentation_path
    end
end
