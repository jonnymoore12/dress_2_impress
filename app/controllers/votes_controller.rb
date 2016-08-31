class VotesController < ApplicationController

  # def new
  #   @dilemma.
  # end

  def create
    @dilemma = Dilemma.find(params[:dilemma_id])
    # @vote = @dilemma.votes.build_with_user()
  end


end
