class Answer < ActiveRecord::Base
    belongs_to :question
end

# == Schema Information
#
# Table name: answers
#
#  id          :integer         not null, primary key
#  ip          :string(255)
#  cookie      :string(255)
#  result      :integer
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

