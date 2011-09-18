class Question < ActiveRecord::Base
    belongs_to :presentation
    has_many :answers

    default_scope :order => 'created_at ASC'
    scope :enabled, where(:enabled => true)

    serialize :choices


end




# == Schema Information
#
# Table name: questions
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  presentation_id :integer
#  enabled         :boolean         default(FALSE)
#  choices         :string(255)
#

