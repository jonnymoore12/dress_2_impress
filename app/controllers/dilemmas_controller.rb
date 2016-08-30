class DilemmasController < ApplicationController

  def index
    @dilemmas = Dilemma.all
  end

end
