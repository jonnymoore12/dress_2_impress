class VotesController < ApplicationController

  before_action :authenticate_user!
  # def new
  #   @dilemma.
  # end

  def create
    @dilemma = Dilemma.find(params[:dilemma_id])

    @vote = @dilemma.votes.build_with_user(vote_params, current_user)
    if @vote.save
      flash[:notice] = 'You have voted'
      redirect_to dilemma_path(@dilemma)
    else
      if @vote.errors[:user]
        # WHY IS THIS HERE???
        flash[:notice] = 'You have voted'

        redirect_to dilemmas_path, alert: 'You have already voted on this dilemma'
      else
        flash[:notice] = 'You have already voted on this dilemma'

        redirect_to dilemmas_path
      end
    end
  end

  private
  def vote_params
    {"choice": params[:"choice"]}
    # params.require(:vote).permit(:choice)
  end


end
