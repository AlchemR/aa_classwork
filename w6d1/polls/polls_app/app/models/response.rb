# == Schema Information
#
# Table name: responses
#
#  id         :bigint           not null, primary key
#  choice_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#
class Response < ApplicationRecord

  belongs_to :respondent,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_one :choice,
  primary_key: :id,
  foreign_key: :choice_id
  class_name: :Answerchoice

end
