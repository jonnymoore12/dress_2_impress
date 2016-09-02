class DilemmasController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  def index
    @dilemmas = Dilemma.all
    @vote = Vote.new
  end

  def new
    @dilemma = Dilemma.new
  end

  def create
    @dilemma = current_user.dilemmas.new(dilemma_params)
    if @dilemma.save# && params[:option1].present? && params[:option2].present?
      render 'crop'
    else
      render 'new'
    end
  end

  def crop
    @dilemma = Dilemma.find(params[:id])
  end

  def update
    @dilemma = Dilemma.find(params[:id])

    if @dilemma.update_attributes(dilemma_params)
      redirect_to user_path(current_user)
    else
      # render 'edit'
    end
  end

  def destroy
    @dilemma = Dilemma.find(params[:id])
    @dilemma.destroy
    flash[:notice] = 'Dilemma deleted'
    redirect_to "/users/#{current_user.id}"
  end

  def show
    @dilemma = Dilemma.find(params[:id])
    @vote1_count = @dilemma.votes.where(choice: '1').count
    @vote2_count = @dilemma.votes.where(choice: '2').count
    @vote1_proportions = 100 * ((@vote1_count+1.0)/(@vote2_count+1.0))
    @vote2_proportions = 100 * ((@vote2_count+1.0)/(@vote1_count+1.0))
  end

private

  def dilemma_params
    params.require(:dilemma).permit(:occasion, :option1, :option2,
     :option1_original_w, :option1_original_h, :option1_box_w, :option1_crop_x, :option1_crop_y, :option1_crop_w, :option1_crop_h, :option1_aspect,
     :option2_original_w, :option2_original_h, :option2_box_w, :option2_crop_x, :option2_crop_y, :option2_crop_w, :option2_crop_h, :option2_aspect)
  end
end
