class PagesController < ApplicationController


def home
end

def experiment
end

def homenew 
         redirect_to '/begin'
end

def mapper
  @information = params[:id];
end

def begin
end

def geturl
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f
    @presentation = Presentation.closest_presentation(latitude, longitude)
    if @presentation 
        redirect_to @presentation
    else
        render 'home'
    end
end

end
