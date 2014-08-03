class ChangeColumnEmpresasCnpjString < ActiveRecord::Migration
  def change
        change_column :empresas, :cnpj, :string
  end
end
