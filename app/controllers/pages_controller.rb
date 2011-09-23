class PagesController < ApplicationController

def home
end

def experiment
end

def mapper
  @information = params[:id];
end

def begin
    redirect_to new_presentation_path if mobile_browser?
end

end
