class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :razao_social
      t.bigint :cnpj
      t.date :dt_abertura

      t.timestamps
    end
  end
end
