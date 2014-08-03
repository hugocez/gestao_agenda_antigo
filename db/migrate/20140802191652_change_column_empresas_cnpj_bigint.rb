class ChangeColumnEmpresasCnpjBigint < ActiveRecord::Migration
  def change
    change_column :empresas, :cnpj, :bigint
  end
end
