json.extract! reserva, :id, :fecha, :hora, :observaciones, :paciente_id, :medico_id, :estado_id, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
