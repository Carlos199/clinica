class Dia < ApplicationRecord
	has_many :has_horarios, inverse_of: :dia, dependent: :destroy
has_many :horarios, through: :has_horarios
end
