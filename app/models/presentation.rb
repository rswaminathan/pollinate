class Presentation < ActiveRecord::Base
    has_many :questions


        def not_completed(cookie)
            answered_questions = Set.new (questions.map {|q|
                q.answers.where(:cookie => cookie)
            }).flatten
            binding.pry
            enabled_questions = Set.new questions.enabled
           (enabled_questions - answered_questions).to_a
        end

end

# == Schema Information
#
# Table name: presentations
#
#  id         :integer         not null, primary key
#  time       :datetime
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

