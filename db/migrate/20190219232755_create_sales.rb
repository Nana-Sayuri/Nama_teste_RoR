class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.string :buyer
      t.string :description
      t.decimal :unity_price, precision: 12, scale: 6
      t.integer :quantity
      t.string :address
      t.string :supplier

      t.timestamps
    end
  end
end
