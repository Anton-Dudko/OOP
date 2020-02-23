class CampaignsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
    def index
      @campaign = Campaign.all
    end

    def new
      @campaign = current_user.campaigns.build
      @campaign = Campaign.new
    end

    def show
      @campaign = Campaign.find(params[:id])
    end

    def edit
      @campaign = Campaign.find(params[:id])
    end

    def update
      @campaign = Campaign.find(params[:id])

      if @campaign.update(campaign_params)
        redirect_to @campaign
      else
        render :edit
      end

    end

    def destroy
      @campaign = Campaign.find(params[:id])

      @campaign.destroy
      redirect_to campaigns_path
    end

    def create
      @campaign = current_user.campaigns.build(campaign_params)
      @campaign.user = current_user

      if @campaign.save
        redirect_to @campaign
      else
        render :new
      end

    end

    private def campaign_params
      params.require(:campaign).permit(:title, :summary, :body, :video, :aim, :current, :user_id, :all_tags, :category_id, :image)
    end

end
