class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.string :fport
      t.string :tport
      t.date :ddate
      t.date :rdate
      t.string :email

      t.timestamps
    end
  end
end
