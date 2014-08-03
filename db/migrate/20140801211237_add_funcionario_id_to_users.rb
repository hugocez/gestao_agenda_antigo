class AddFuncionarioIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :funcionario_id, :integer
    add_index :users, :funcionario_id
  end
end
