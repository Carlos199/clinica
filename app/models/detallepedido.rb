class Detallepedido < ApplicationRecord
  belongs_to :pedido
  belongs_to :item
end
