class PagesController < ApplicationController

    layout 'mobile'

def home
end

def experiment
end

def homenew 
    if mobile_browser?
         redirect_to '/begin'
    end
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
        redirect_to mobile_home_path
    end
end

end
