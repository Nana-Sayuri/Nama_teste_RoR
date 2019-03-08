class CreateResumes < ActiveRecord::Migration[5.2]
  def change
    create_table :resumes do |t|
      t.string :name
      t.string :attachment
      t.string :string
      t.string :buyer
      t.string :description
      t.decimal :unit_price, precision: 12, scale: 6
      t.integer :amount
      t.string :address
      t.string :provider
      t.string :file_name
    end
  end
end
