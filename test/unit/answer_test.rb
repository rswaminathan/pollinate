require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

