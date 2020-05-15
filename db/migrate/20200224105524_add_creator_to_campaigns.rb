class AddCreatorToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :creator, :string
  end
end
