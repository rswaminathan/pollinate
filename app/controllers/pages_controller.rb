class PagesController < ApplicationController

def home
end

def experiment
end

def mapper
  @information = params[:id];
end

def begin
     if mobile_browser?
        redirect_to new_presentation_path
     end
end

end
