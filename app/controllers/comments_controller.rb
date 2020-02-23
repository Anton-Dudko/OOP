class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @comment = @campaign.comments.create(comments_params)
    redirect_to campaign_path(@campaign)
  end

  def destroy
    @campaign = Campaign.find(params[:campaign_id])
    @comment = @campaign.comments.find(params[:id])
    @comment.destroy
    redirect_to campaign_path(@campaign)
  end

  def edit
    @campaign = Campaign.find(params[:campaign_id])
    @comment = @campaign.comments.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @comment = @campaign.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @campaign
    else
      render :edit
    end

  end

  private def comments_params
    params.require(:comment).permit(:username, :body)
  end
end
