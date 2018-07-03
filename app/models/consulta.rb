class Consulta < ApplicationRecord
  belongs_to :medico
  belongs_to :paciente
   validates_uniqueness_of :data
end
