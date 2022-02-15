class AddUserRoletoUsers < ActiveRecord::Migration[6.1]
  def change
      add_column :users, :user_role_id, :integer
  end
end
