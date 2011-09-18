class PresentationsController < ApplicationController

    def results
        @presentation = Presentation.find(params[:presentation_id])
        @questions = @presentation.questions
    end

    def index
    end

    def show
        session[:cookie] ||= (request.ip + rand(100000000).to_s)
        @presentation = Presentation.find(params[:id])
        @question = @presentation.not_completed(session[:cookie]).first
    end

    def new
        @presentation = Presentation.new
    end

    def create
        @presentation = Presentation.create(params[:presentation])
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
