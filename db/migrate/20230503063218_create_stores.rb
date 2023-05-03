class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :location
      t.string :address
      t.string :description

      t.timestamps
    end
  end
end
