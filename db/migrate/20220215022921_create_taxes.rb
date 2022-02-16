class CreateTaxes < ActiveRecord::Migration[6.1]
  def change
    create_table :taxes do |t|
      t.string :tax_category
      t.decimal :tax_rate

      t.timestamps
    end
  end
end
