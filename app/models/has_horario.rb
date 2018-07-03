class HasHorario < ApplicationRecord
  belongs_to :dia
  belongs_to :horario
end
