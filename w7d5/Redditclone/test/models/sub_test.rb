# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class SubTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
