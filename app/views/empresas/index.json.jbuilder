json.array!(@empresas) do |empresa|
  json.extract! empresa, :id, :razao_social, :cnpj, :dt_abertura
  json.url empresa_url(empresa, format: :json)
end
