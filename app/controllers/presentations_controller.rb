class PresentationsController < ApplicationController
  layout :resolve_layout
    def results
        @presentation = Presentation.find(params[:id])
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
    

    def dashboard
        @presentation = Presentation.find_by_secret_token(params[:token])
        @questions = @presentation.questions
        render 'results'
    end

    def create
        @presentation = Presentation.create(params[:presentation])
        if @presentation.save
            flash[:success] = "Presentation Created"
            redirect_to dashboard_path(@presentation)
        else
            flash[:error] = "A Terrible Error has Occured."
        end
    end

    def update
      @presentation = Presentation.find(params[:id])
      @presentation.update_attributes(params[:presentation])
      if @presentation.save
          flash[:success] = "Your Social Tags have been Saved"
      else
          flash[:error] = "Something went wrong"
      end
      redirect_to dashboard_path(@presentation)
    end

    def destroy
      
    end

    def edit
      @presentation = Presentation.find(params[:id])

    end
    
    def edit_social_info
      @presentation = Presentation.find(params[:id])
      if @presentiation.save
          flash[:success] = "The Presentation has been Updated"
      else
          flash[:error] = "Something went wrong"
      end
      redirect_to dashboard_path(@presentation)
      
      @presentation = Presentation.find(params[:id])
      @presentation.update_attributes!(:latitude => params[:lat], :longitude => params[:lon])
      flash.now[:success] = "Updated location"
    end
    
    private
    def resolve_layout 
      case action_name
        when "results", "dashboard", "new"
          "presenter"
        else
          "mobile"
        end
    end
    
end
