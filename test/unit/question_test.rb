require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

