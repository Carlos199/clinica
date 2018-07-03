class Horario < ApplicationRecord

  belongs_to :medico
    has_many :has_horarios, inverse_of: :horario, dependent: :destroy
  after_create :save_dias
    has_many :dias, through: :has_horarios
    
    def dias=(value)
    @dias = value
    end
    
    private
    def save_dias
    @dias.each do |dia_id|
        HasHorario.create(dia_id: dia_id, horario_id: self.id)
    end
end
end
