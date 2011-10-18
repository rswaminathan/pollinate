class Presentation < ActiveRecord::Base
    has_many :questions
    before_save :create_secret_token

    def not_completed(cookie)
        answers = (questions.map {|q|
            q.answers.where(:cookie => cookie)
        }).flatten
        answered_questions = Set.new(answers.map &:question)
        enabled_questions = Set.new questions.enabled
        (enabled_questions - answered_questions).to_a
    end

    def create_secret_token
        secret_token = rand(36**8).to_s(36)
        
    end

    class << self

        def closest_presentation(latitude, longitude)
            notnil =  all.reject{|p| p.latitude == nil || p.longitude == nil}
            remove_large = notnil.reject{|p| angle(p.latitude, p.longitude, latitude, longitude) == 2*Math::PI}
            remove_large.sort_by{ |p| angle(p.latitude, p.longitude, latitude, longitude)}.first
        end

        def angle(lat1, long1, lat2, long2)
            largest_allowed_angle = 1/6378.1 #1 km angle
            angle = Math.acos(Math.sin(lat1)*Math.sin(lat2) +
                      Math.cos(lat1)*Math.cos(lat2)*Math.cos(long2-long1))
            angle < largest_allowed_angle ? angle : 2*Math::PI
        end

    end

end




# == Schema Information
#
# Table name: presentations
#
#  id           :integer         not null, primary key
#  time         :datetime
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  latitude     :float
#  longitude    :float
#  secret_token :string(255)
#

