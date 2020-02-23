class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :summary
      t.text :body
      t.string :video
      t.integer :aim
      t.integer :current
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
