class PagesController < ApplicationController

def home
end

def experiment
end

def homenew 
     if mobile_browser?
         redirect_to 'begin'
     end
end

def mapper
  @information = params[:id];
end

def begin
end

end
