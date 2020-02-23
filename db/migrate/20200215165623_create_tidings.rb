class CreateTidings < ActiveRecord::Migration[5.2]
  def change
    create_table :tidings do |t|
      t.string :title
      t.text :body
      t.string :image
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
