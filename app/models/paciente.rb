class Paciente < ApplicationRecord
  belongs_to :ciudade
  belongs_to :sexo
  has_many :sales

  has_many :medicos, :through => :consultas
  has_many :consultas

  validates_presence_of :nome
   def completo
         "#{nombre}" +".."+ "#{apellido}"
  end
end
