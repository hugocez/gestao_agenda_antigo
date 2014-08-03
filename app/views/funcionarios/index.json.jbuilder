json.array!(@funcionarios) do |funcionario|
  json.extract! funcionario, :id, :nome, :user_id
  json.url funcionario_url(funcionario, format: :json)
end
