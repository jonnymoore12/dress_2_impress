class Vote < ActiveRecord::Base
  belongs_to :dilemma
  belongs_to :user
end
