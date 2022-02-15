class CreateRegions < ActiveRecord::Migration[6.1]
  def change
    create_table :regions do |t|
      t.string :title
      t.integer :country_id
      t.integer :currency_id
      t.integer :tax_id

      t.timestamps
    end
  end
end
