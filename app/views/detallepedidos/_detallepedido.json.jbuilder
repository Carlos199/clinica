json.extract! detallepedido, :id, :solicitado, :surtido, :pedido_id, :insumo_id, :observaciones, :created_at, :updated_at
json.url detallepedido_url(detallepedido, format: :json)
