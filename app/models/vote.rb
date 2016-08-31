class Vote < ActiveRecord::Base
  belongs_to :dilemma
  belongs_to :user
  validates :user, uniqueness: { scope: :dilemma, message: 'has voted on this dilemma already' }

end
