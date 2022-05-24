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
class Answerchoice < ApplicationRecord

  belongs_to :question
  primary_key: :id
  foreign_key: :question_id
  class_name: :Question

  belongs_to :responses
  primary_key: :id
  foreign_key: :choice_id
  class_name: :Response
  
  belongs_to :user
  primary_key: :id
  foreign_key: :user_id
  class_name: :User

end
