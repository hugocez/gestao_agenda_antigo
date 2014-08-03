class AddEmpresaIdToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :empresa_id, :integer
    add_index :funcionarios, :empresa_id
  end
end
