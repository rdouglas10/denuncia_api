class AddTokenUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :token_access, :string
  end
end
