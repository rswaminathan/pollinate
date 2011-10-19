class Presentation < ActiveRecord::Base
    has_many :questions
    after_create :create_secret_token
    validates :name, :presence => true
    validates :email, :presence => true

    def not_completed(cookie)
        answers = (questions.map {|q|
            q.answers.where(:cookie => cookie)
        }).flatten
        answered_questions = Set.new(answers.map &:question)
        enabled_questions = Set.new questions.enabled
        (enabled_questions - answered_questions).to_a
    end


    class << self

        def closest_presentation(latitude, longitude)
            largest_allowed_angle = 1/6378.1 #0.5 km angle
            notnil =  all.reject{|p| p.latitude == nil || p.longitude == nil || p.updated_at < 1.day.ago }
            with_angles = notnil.map {|p| [p, angle(p.latitude, p.longitude, latitude, longitude)]} #map to [presentation, angle] pairs
            in_allowed_range = with_angles.reject{ |pair| pair[1] > largest_allowed_angle}.first #get first tuple, t1.day.ago
            closest_pair = with_angles.sort_by {|pair| pair[0].updated_at }.first
            if closest_pair.nil?
                return nil
            else
                return closest_pair.first
            end
        end

        def to_radian(coord)
            coord/180 * Math::PI
        end

        def angle(lat1, long1, lat2, long2)
            lat1 = to_radian(lat1)
            lat2 = to_radian(lat2)
            long1 = to_radian(long1)
            long2 = to_radian(long2)
            #use Haversine formula , more stable
            angle = 2*Math.asin(Math.sqrt(Math.sin((lat2-lat1)/2)**2 +
                                         Math.cos(lat1)*Math.cos(lat2)*Math.sin((long2-long1)/2)**2
                                         ))
            #angle = Math.acos(Math.sin(lat1)*Math.sin(lat2) +
            #          Math.cos(lat1)*Math.cos(lat2)*Math.cos(long2-long1))
        end

    end

    private

    def create_secret_token
        self.secret_token = rand(36**8).to_s(36)
        save
        
    end

end






# == Schema Information
#
# Table name: presentations
#
#  id              :integer         not null, primary key
#  time            :datetime
#  name            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  latitude        :float
#  longitude       :float
#  secret_token    :string(255)
#  twitter_handle  :string(255)
#  linkedIn_handle :string(255)
#  email           :string(255)
#

