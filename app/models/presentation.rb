class Presentation < ActiveRecord::Base
    has_many :questions


        def not_completed(cookie)
            answers = (questions.map {|q|
                q.answers.where(:cookie => cookie)
            }).flatten

            answered_questions = Set.new(answers.map &:question)
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

