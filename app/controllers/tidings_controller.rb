class TidingsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @tiding = @campaign.tidings.create(tiding_params)
    if @tiding.save
      redirect_to campaign_path(@campaign)
    else
      render :new
    end
  end

  def show
    @campaign = Campaign.find(params[:campaign_id])
    @tiding = @campaign.tidings.find(params[:id])
  end

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @tiding=Tiding.new
  end

  def destroy
    @campaign = Campaign.find(params[:campaign_id])
    @tiding = @campaign.tidings.find(params[:id])
    @tiding.destroy
    redirect_to campaign_path(@campaign)
  end

  def edit
    @campaign = Campaign.find(params[:campaign_id])
    @tiding=Tiding.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @tiding = Tiding.find(params[:id])
    @tiding.update_attributes(tiding_params)
    if @tiding.save
      redirect_to campaign_path(@campaign)
    else
      render :edit
    end
  end

  private def tiding_params
    params.require(:tiding).permit(:title, :body, :image)
  end

end
