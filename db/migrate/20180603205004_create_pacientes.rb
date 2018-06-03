class CreatePacientes < ActiveRecord::Migration[5.0]
  def change
    create_table :pacientes do |t|
      t.string :ci
      t.string :nombre
      t.string :apellido
      t.string :direccion
      t.string :telefono
      t.string :celular
      t.date :fecha
      t.string :correo
      t.string :contacto_familiar
      t.references :ciudade, foreign_key: true
      t.references :sexo, foreign_key: true

      t.timestamps
    end
  end
end
