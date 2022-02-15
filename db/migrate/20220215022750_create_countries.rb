class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.string :title
      t.string :country_code

      t.timestamps
    end
  end
end
