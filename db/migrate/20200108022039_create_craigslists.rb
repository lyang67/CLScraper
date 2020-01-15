class CreateCraigslists < ActiveRecord::Migration[6.0]
  def change
    create_table :craigslists do |t|
      t.integer :numSeeds

      t.timestamps
    end
  end
end
