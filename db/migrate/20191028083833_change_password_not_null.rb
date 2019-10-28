class ChangePasswordNotNull < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :password, :string, null: false
  end

  def down
    change_column :users, :password, :string
  end
end
