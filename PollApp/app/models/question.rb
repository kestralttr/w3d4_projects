# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :text, presence: true
  validates :poll_id, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  has_many :responses,
    through: :answer_choices,
    source: :response

  def results
    # count = Hash.new(0)
    # self.answer_choices.each do |answer_choice|
    #   if !answer_choice.response.nil?
    #     count[answer_choice.answer] += 1
    #   end
    # end
    # count

    count = Hash.new(0)
    answer_choices = self.answer_choices.includes(:response).where(answer_choice_id: self.answer_choices.id)
    p answer_choices
    # answer_choices.each do |answer_choice|
    #   # if !answer_choice.response.nil?
    #   count[answer_choice.response] +=1
    # end
    # count
  end

end
