class DilemmasController < ApplicationController

  def index
    @dilemmas = Dilemma.all
  end

  def new
    @dilemma = Dilemma.new
  end

  def create
    @dilemma = Dilemma.new(dilemma_params)
    if @dilemma.save
      redirect_to '/dilemmas'
    else
      render 'new'
    end
  end

private

  def dilemma_params
    params.require(:dilemma).permit(:occasion)
  end
end
