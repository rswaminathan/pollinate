class Presentation < ActiveRecord::Base
    has_many :questions
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

