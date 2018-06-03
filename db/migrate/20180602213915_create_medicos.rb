class CreateMedicos < ActiveRecord::Migration[5.0]
  def change
    create_table :medicos do |t|
      t.string :ci
      t.string :nro_registo
      t.string :nombre
      t.string :apellido
      t.string :direccion
      t.string :telefono
      t.string :celular
      t.date :fecha
      t.string :correo
      t.string :contacto_familiar
      t.references :especialidade, foreign_key: true
      t.references :ciudade, foreign_key: true

      t.timestamps
    end
  end
end
