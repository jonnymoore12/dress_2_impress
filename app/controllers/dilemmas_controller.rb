class DilemmasController < ApplicationController

  def index
    @dilemmas = Dilemma.all
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

private

  def dilemma_params
    params.require(:dilemma).permit(:occasion, :option1, :option2)
  end
end
