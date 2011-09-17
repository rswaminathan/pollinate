class QuestionsController < ApplicationController

    def index
    end

    def new
        @presentation = Presentation.find(params[:presentation])
        @question = @presentation.question.build
    end

    def create
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
