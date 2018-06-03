class AddSexoToMedicos < ActiveRecord::Migration[5.0]
  def change
    add_reference :medicos, :sexo, foreign_key: true
  end
end
