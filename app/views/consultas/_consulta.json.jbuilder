json.extract! consulta, :id, :data, :preco, :nome_plano, :tipo_plano, :tipo_consula, :medico_id, :paciente_id, :created_at, :updated_at
json.url consulta_url(consulta, format: :json)
