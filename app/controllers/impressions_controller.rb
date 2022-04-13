class ImpressionsController < ApplicationController
  def index
    @new_impression = Impression.new
    @impressions = Impression.all
    @tags = Impression.tag_counts_on(:tags).most_used(20)
  end
  def show
    @impression = Impression.find(params[:id])
    @post_impressions = @impression.post_impressions
    @post_impression = PostImpression.new
  end
  def create
    @new_impression = Impression.new(impression_params)
    @new_impression.save
    redirect_to root_path
  end

  private
  def impression_params
    params.require(:impression).permit(:body, :tag_list, :user_id)
  end
end

