class DilemmasController < ApplicationController

  def index
    @dilemmas = Dilemma.all
    @vote = Vote.new
  end

  def new
    @dilemma = Dilemma.new
  end

  def create
    @dilemma = current_user.dilemmas.new(dilemma_params)
    if @dilemma.save
      redirect_to '/dilemmas'
    else
      render 'new'
    end
  end

  def destroy
    @dilemma = Dilemma.find(params[:id])
    @dilemma.destroy
    flash[:notice] = 'Dilemma deleted'
    redirect_to "/users/#{current_user.id}"

  end

private

  def dilemma_params
    params.require(:dilemma).permit(:occasion, :option1, :option2)
  end
end
