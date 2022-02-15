class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :title
      t.string :currency_code

      t.timestamps
    end
  end
end
