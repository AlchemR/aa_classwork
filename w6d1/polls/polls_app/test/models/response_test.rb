# == Schema Information
#
# Table name: responses
#
#  id         :bigint           not null, primary key
#  choice_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#
require "test_helper"

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
