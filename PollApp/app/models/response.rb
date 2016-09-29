# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime
#  updated_at       :datetime
#

class Response < ActiveRecord::Base
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
  validate :respondent_already_answered?
  validate :author_cant_respond

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question

  def author_cant_respond
    if self.answer_choice.question.poll.author_id == self.user_id#where(author_id: self.user_id).exists?
      self.errors[:author] << "can't respond to own poll"
    end
  end

  def sibling_responses

    result = self.question.responses.where.not(id: self.id)
    # question = self.answer_choice.question
    #
    # question.answer_choices.includes(:response)
  end

  def respondent_already_answered?
    if self.sibling_responses.exists?(user_id: self.user_id)
      self.errors[:response] << "already exists for this question"
    end
  end

end
