# == Schema Information
#
# Table name: answerchoices
#
#  id          :bigint           not null, primary key
#  question_id :integer          not null
#  user_id     :integer          not null
#  choice      :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class AnswerchoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
