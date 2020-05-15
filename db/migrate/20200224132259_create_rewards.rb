class CreateRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :rewards do |t|
      t.string :title
      t.string :body
      t.integer :cost
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
