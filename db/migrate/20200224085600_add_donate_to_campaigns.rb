class AddDonateToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :donate, :float
  end
end
