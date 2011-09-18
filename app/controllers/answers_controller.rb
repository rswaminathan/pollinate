class AnswersController < ApplicationController
    def create
        @presentation = Presentation.find(params[:presentation_id])
        @question = Question.find(params[:question_id])
        params_with_cookie = params[:answer]
        params_with_cookie[:cookie] = session[:cookie]
        @answer= @question.answers.build(params_with_cookie)
        if @answer.save
            flash[:success] = "Saved your answer."
        else
            flash[:error] = "Something went wrong when saving your answer. Try again."
        end
        redirect_to presentation_path(@presentation)
    end
end
