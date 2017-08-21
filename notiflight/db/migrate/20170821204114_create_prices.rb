class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.string :price
      t.references :flight, foreign_key: true

      t.timestamps
    end
  end
end
