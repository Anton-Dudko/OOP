module CampaignsHelper
  def tag_cloud(tags)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      yield(tag)
    end

  end
end
