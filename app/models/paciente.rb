class Paciente < ApplicationRecord
  belongs_to :ciudade
  belongs_to :sexo
  has_many :sales
   def completo
         "#{nombre}" +".."+ "#{apellido}"
  end
end
