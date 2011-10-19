class PagesController < ApplicationController
  layout :resolve_layout

  def home
  end

  def experiment
  end

  def homenew 
      if mobile_version?
           redirect_to '/begin'
      end
  end

  def mapper
    @information = params[:id];
  end

  def begin
  end

  def go_pro
  end

  def help
  end

  def about
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

  private
  def resolve_layout 
    case action_name
      when "about", "help", "go_pro"
        "presenter"
      else
        "mobile"
      end
  end



end
