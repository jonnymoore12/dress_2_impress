class User < ActiveRecord::Base
  has_many :dilemmas
  has_many :votes
  has_many :voted_dilemmas, through: :votes, source: :dilemma
  # before_action :authenticate_user!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
end
