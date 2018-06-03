class Medico < ApplicationRecord
  belongs_to :especialidade
  belongs_to :ciudade
end
