class ApplicationController < ActionController::Base
    protect_from_forgery
    helper :all


    def dashboard_path(presentation)
        "/dashboard/#{presentation[:secret_token]}"
    end

    private
    MOBILE_BROWSERS = ["android", "iphone", "ipod", "opera mini", "blackberry", "palm","hiptop","avantgo","plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;","windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]

    def mobile_browser?
        agent = request.headers["HTTP_USER_AGENT"].downcase
        MOBILE_BROWSERS.each do |m|
            return true if agent.match(m)
        end
        return false
    end
end
