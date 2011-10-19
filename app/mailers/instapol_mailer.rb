class InstapolMailer < ActionMailer::Base
    default :from => "no-reply@instapol.com"
    default_url_options[:host] = "instapol.com"

    def welcome_email(presentation, dashboard_url)
        @presentation = presentation
        @dashboard_url = dashboard_url
        mail(:to => @presentation.email, :subject => "Welcome to instapol! #{@presentation.name} has been created.")
    end

end
