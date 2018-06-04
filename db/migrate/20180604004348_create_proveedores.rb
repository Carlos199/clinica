class CreateProveedores < ActiveRecord::Migration[5.0]
  def change
    create_table :proveedores do |t|
      t.string :ci
      t.string :nombre
      t.string :apellido
      t.references :ciudade, foreign_key: true
      t.string :direccion
      t.references :empresa, foreign_key: true
      t.string :telefono
      t.string :cellular
      t.string :correo
      t.string :foto

      t.timestamps
    end
  end
end
