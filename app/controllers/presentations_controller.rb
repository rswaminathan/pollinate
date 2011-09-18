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

    def location
    end
    
    def create
        @presentation = Presentation.create(params[:presentation])
        if @presentation.save
            flash[:success] = "Presentation Created"
            redirect_to new_presentation_question_path(@presentation)
        else
            flash[:error] = "A Terrible Error has Occured."
        end
    end

    def update
      @presentation = Presentation.find(params[:id])
      @presentation.update_attributes!(:latitude => params[:lat], :longitude => params[:lon])
      flash.now[:success] = "Updated location"
    end

    def destroy
    end

    def edit
      @presentation = Presentation.find(params[:id])
      @presentation.update_attributes!(:latitude => params[:lat], :longitude => params[:lon])
      redirect_to presentation_results_path(@presentation)
    end

end
