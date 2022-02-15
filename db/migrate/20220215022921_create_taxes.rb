class CreateTaxes < ActiveRecord::Migration[6.1]
  def change
    create_table :taxes do |t|
      t.string :title
      t.string :tax_category

      t.timestamps
    end
  end
end
