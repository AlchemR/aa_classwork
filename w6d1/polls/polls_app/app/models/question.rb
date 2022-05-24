# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  poll_id    :integer          not null
#
class Question < ApplicationRecord

  belongs_to :poll,
  primary_key: :id,
  foreign_key: :poll_id,
  class_name: :Poll

  has_many :answer_choices,
  primary_key: :id,
  foreign_key: :question_id,
  class: :Answerchoice


end
