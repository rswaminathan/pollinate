class Question < ActiveRecord::Base
    belongs_to :presentation
    has_many :answers
end

# == Schema Information
#
# Table name: questions
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

