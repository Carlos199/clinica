class CreateEnfermeros < ActiveRecord::Migration[5.0]
  def change
    create_table :enfermeros do |t|
      t.string :ci
      t.string :nro_registro
      t.string :nombre
      t.string :apellido
      t.string :direccion
      t.references :ciudade, foreign_key: true
      t.references :cargo, foreign_key: true
      t.string :telefono
      t.string :celular
      t.string :contacto_familiar
      t.string :correo
      t.string :foto

      t.timestamps
    end
  end
end
