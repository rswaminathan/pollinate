require 'test_helper'

class PresentationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
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

