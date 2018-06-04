class Proveedore < ApplicationRecord
  belongs_to :ciudade
  belongs_to :empresa
  has_many :pedidos
end
